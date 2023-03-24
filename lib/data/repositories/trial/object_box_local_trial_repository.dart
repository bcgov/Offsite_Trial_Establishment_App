import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/extensions/iterable_ext.dart';
import 'package:offsite_trial_establishment_app/common/extensions/object_box_extensions.dart';
import 'package:offsite_trial_establishment_app/common/utils/object_box_manager.dart';
import 'package:offsite_trial_establishment_app/common/utils/object_box_stream_manager.dart';
import 'package:offsite_trial_establishment_app/data/entities/company_entity.dart';
import 'package:offsite_trial_establishment_app/data/entities/planter_entity.dart';
import 'package:offsite_trial_establishment_app/data/entities/trial_entity.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status_db_mapper.dart';
import 'package:offsite_trial_establishment_app/data/extensions/trial_db_mapper.dart';
import 'package:offsite_trial_establishment_app/di/di.dart';
import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';
import 'package:offsite_trial_establishment_app/domain/models/trial.dart';
import 'package:offsite_trial_establishment_app/domain/repositories/trial/local_trial_repository.dart';
import 'package:offsite_trial_establishment_app/objectbox.g.dart';
import 'package:offsite_trial_establishment_app/objectbox.g.dart' as ob;

@LazySingleton(as: LocalTrialRepository)
class ObjectBoxLocalTrialRepository extends LocalTrialRepository {
  late final ObjectBoxManager _manager;
  late ObjectBoxStreamManager<TrialEntity> _streamManager;
  late Box<TrialEntity> _box;
  late Box<CompanyEntity> _companyBox;
  late Box<PlanterEntity> _planterBox;

  ObjectBoxLocalTrialRepository() {
    _manager = getIt();
    _init();
  }

  ObjectBoxLocalTrialRepository.withManager(this._manager) {
    _init();
  }

  void _init() {
    _streamManager = ObjectBoxStreamManager<TrialEntity>(_manager);
    _manager.addCallback((store) {
      _box = store.box();
      _companyBox = store.box();
      _planterBox = store.box();
    });
  }

  @override
  Stream<List<Trial>> getAll() {
    final planterIds = _planterBox.buildQuery(PlanterEntity_.isActive.equals(true)).findIds();
    if (planterIds.isEmpty) return Stream.value([]);
    return _streamManager
        .watch(
          (box) => box.watchQuery(TrialEntity_.planter.equals(planterIds.first)),
        )
        .queryMap((e) => e.toModel());
  }

  @override
  Stream<List<Trial>> getUnsynced() {
    return _streamManager
        .watch(
          (box) => box.watchQuery(
              TrialEntity_.syncStatusOB.oneOf([SyncStatus.waitingInsert.dbValue, SyncStatus.waitingUpdate.dbValue])),
        )
        .queryMap((e) => e.toModel());
  }

  @override
  Stream<Trial?> getByIdStream(int id) {
    return _streamManager
        .watchFirst(
          (box) => box.watchFirstQuery(TrialEntity_.dbId.equals(id)),
        )
        .map((e) => e?.toModel());
  }

  @override
  Stream<List<int>> getInternalIdsInOrder() {
    final planterIds = _planterBox.buildQuery(PlanterEntity_.isActive.equals(true)).findIds();
    if (planterIds.isEmpty) return Stream.value([]);
    return _streamManager.watchIds(
          (box) =>
          box.watchIdsQuery(TrialEntity_.planter.equals(planterIds[0]), TrialEntity_.modifiedDate, ob.Order.descending),
    );
  }

  @override
  Future<Trial?> getById(int id) {
    return _box.buildQuery(TrialEntity_.dbId.equals(id)).mapFirst((e) => e?.toModel());
  }

  @override
  Future<void> delete(Trial trial) async {
    final entities = await _box.buildQuery(TrialEntity_.dbId.equals(trial.internalId)).findAll();
    await _delete(entities);
  }

  @override
  Future<void> deleteById(int id) async {
    final entities = await _box.buildQuery(TrialEntity_.dbId.equals(id)).findAll();
    await _delete(entities);
  }

  Future<void> _delete(List<TrialEntity> entities) async {
    _manager.store.runInTransaction(TxMode.write, () {
      _box.removeMany(entities.mapList((e) => e.dbId));
      _companyBox.removeMany(
        entities
            .mapListNotNull((e) => e.contact.target?.dbId)
            .where((element) => _box.buildQuery(TrialEntity_.contact.equals(element)).findFirst() == null)
            .toList(),
      );
    });
  }

  @override
  Future<Trial> save(Trial trial) async {
    final int? ownerId;
    if (trial.contact != null) {
      ownerId = _companyBox.put(trial.contact!.toEntity());
    } else {
      ownerId = trial.contact?.internalId;
    }
    final id = _box.put(trial.toEntity(
      ownerId: ownerId,
    ));
    return trial.copyWith(internalId: id);
  }

  @override
  Future<bool> hasTrialId(String id) async {
    return _box.buildQuery(TrialEntity_.trialId.equals(id)).findFirst() != null;
  }

  @override
  Future<bool> hasCompanyId(String id) async {
    return _companyBox.buildQuery(CompanyEntity_.companyId.equals(id)).findFirst() != null;
  }

  @override
  Future<void> clearSyncing() async {
    final entities = _box
        .buildQuery(TrialEntity_.syncStatusOB.oneOf([
          SyncStatus.inserting.dbValue,
          SyncStatus.updating.dbValue,
          SyncStatus.changedBeforeInsert.dbValue,
        ]))
        .find();
    _box.putMany(entities.mapList((e) => e..syncStatus = e.syncStatus.previous));
  }

  @override
  Future<List<Trial>> getWaitingConfirm() {
    return _box
        .buildQuery(TrialEntity_.syncStatusOB.equals(SyncStatus.waitingConfirmed.dbValue))
        .queryMap((e) => e.toModel());
  }
}
