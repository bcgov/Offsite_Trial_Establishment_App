import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/extensions/iterable_ext.dart';
import 'package:offsite_trial_establishment_app/common/extensions/object_box_extensions.dart';
import 'package:offsite_trial_establishment_app/common/utils/object_box_manager.dart';
import 'package:offsite_trial_establishment_app/common/utils/object_box_stream_manager.dart';
import 'package:offsite_trial_establishment_app/data/entities/planter_entity.dart';
import 'package:offsite_trial_establishment_app/data/entities/planting_entity.dart';
import 'package:offsite_trial_establishment_app/data/entities/trial_entity.dart';
import 'package:offsite_trial_establishment_app/data/extensions/planting_db_mapper.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status_db_mapper.dart';
import 'package:offsite_trial_establishment_app/di/di.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/planting.dart';
import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';
import 'package:offsite_trial_establishment_app/domain/repositories/planting/local_planting_repository.dart';
import 'package:offsite_trial_establishment_app/objectbox.g.dart';
import 'package:offsite_trial_establishment_app/objectbox.g.dart' as ob;

@LazySingleton(as: LocalPlantingRepository)
class ObjectBoxLocalPlantingRepository implements LocalPlantingRepository {
  late final ObjectBoxManager _manager;
  late ObjectBoxStreamManager<PlantingEntity> _streamManager;
  late Box<PlantingEntity> _box;
  late Box<PlanterEntity> _planterBox;
  late Box<TrialEntity> _trialBox;

  ObjectBoxLocalPlantingRepository() {
    _manager = getIt();
    _init();
  }

  ObjectBoxLocalPlantingRepository.withManager(this._manager) {
    _init();
  }

  void _init() {
    _streamManager = ObjectBoxStreamManager<PlantingEntity>(_manager);
    _manager.addCallback((store) {
      _box = store.box();
      _planterBox = store.box();
      _trialBox = store.box();
    });
  }

  @override
  Stream<List<Planting>> getUnsynced() {
    return _streamManager
        .watch(
          (box) => box.watchQuery(
              PlantingEntity_.syncStatusOB.oneOf([SyncStatus.waitingInsert.dbValue, SyncStatus.waitingUpdate.dbValue])),
        )
        .queryMap((e) => e.toModel());
  }

  @override
  Stream<Planting?> getByIdStream(int id) {
    return _streamManager
        .watchFirst(
          (box) => box.watchFirstQuery(PlantingEntity_.dbId.equals(id)),
        )
        .map((e) => e?.toModel());
  }

  @override
  Stream<List<int>> getInternalIdsInOrder() {
    final planterIds = _planterBox.buildQuery(PlanterEntity_.isActive.equals(true)).findIds();
    if (planterIds.isEmpty) return Stream.value([]);
    return _streamManager.watchIds(
      (box) => box.watchIdsQuery(
          PlantingEntity_.planter.equals(planterIds.first), PlantingEntity_.modifiedDate, ob.Order.descending),
    );
  }

  @override
  Future<Planting?> getById(int id) {
    return _box.buildQuery(PlantingEntity_.dbId.equals(id)).mapFirst((e) => e?.toModel());
  }

  @override
  Future<Planting?> getLast() async {
    final planterIds = _planterBox.buildQuery(PlanterEntity_.isActive.equals(true)).findIds();
    if (planterIds.isEmpty) return null;
    return _box
        .buildQuery(PlantingEntity_.planter.equals(planterIds.first), PlantingEntity_.modifiedDate, ob.Order.descending)
        .mapFirst((e) => e?.toModel());
  }

  @override
  Future<void> delete(Planting planting) async {
    _box.remove(planting.internalId);
  }

  @override
  Future<void> deleteById(int id) async {
    _box.remove(id);
  }

  @override
  Future<void> save(Planting planting) async {
    _box.put(planting.toEntity());
  }

  @override
  Future<bool> hasPlantingId(String plantingId) async {
    return _box.buildQuery(PlantingEntity_.plantingId.equals(plantingId)).findFirst() != null;
  }

  @override
  Future<void> clearSyncing() async {
    final entities = _box
        .buildQuery(PlantingEntity_.syncStatusOB.oneOf([
          SyncStatus.inserting.dbValue,
          SyncStatus.updating.dbValue,
          SyncStatus.changedBeforeInsert.dbValue,
        ]))
        .find();
    _box.putMany(entities.mapList((e) => e..syncStatus = e.syncStatus.previous));
  }

  @override
  Future<List<Planting>> getWaitingConfirm() {
    return _box
        .buildQuery(PlantingEntity_.syncStatusOB.equals(SyncStatus.waitingConfirmed.dbValue))
        .queryMap((e) => e.toModel());
  }
}
