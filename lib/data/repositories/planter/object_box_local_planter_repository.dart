import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/extensions/iterable_ext.dart';
import 'package:offsite_trial_establishment_app/common/extensions/object_box_extensions.dart';
import 'package:offsite_trial_establishment_app/common/utils/object_box_manager.dart';
import 'package:offsite_trial_establishment_app/common/utils/object_box_stream_manager.dart';
import 'package:offsite_trial_establishment_app/data/entities/planter_entity.dart';
import 'package:offsite_trial_establishment_app/data/extensions/planter_db_mapper.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status_db_mapper.dart';
import 'package:offsite_trial_establishment_app/di/di.dart';
import 'package:offsite_trial_establishment_app/domain/models/planter.dart';
import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';
import 'package:offsite_trial_establishment_app/domain/repositories/planter/local_planter_repository.dart';
import 'package:offsite_trial_establishment_app/objectbox.g.dart';

@LazySingleton(as: LocalPlanterRepository)
class ObjectBoxLocalPlanterRepository extends LocalPlanterRepository {
  late final ObjectBoxManager _manager;
  late ObjectBoxStreamManager<PlanterEntity> _streamManager;
  late Box<PlanterEntity> _box;

  ObjectBoxLocalPlanterRepository() {
    _manager = getIt();
    _init();
  }

  ObjectBoxLocalPlanterRepository.withManager(this._manager) {
    _init();
  }

  void _init() {
    _streamManager = ObjectBoxStreamManager<PlanterEntity>(_manager);
    _manager.addCallback((store) {
      _box = store.box();
    });
  }

  @override
  Stream<Planter?> getActivePlanter() {
    return _streamManager
        .watchFirst(
          (box) => box.watchFirstQuery(PlanterEntity_.isActive.equals(true)),
        )
        .map((e) => e?.toModel());
  }

  @override
  Stream<List<Planter>> getUnsynced() {
    return _streamManager
        .watch(
          (box) => box.watchQuery(
              PlanterEntity_.syncStatusOB.oneOf([SyncStatus.waitingInsert.dbValue, SyncStatus.waitingUpdate.dbValue])),
        )
        .queryMap((e) => e.toModel());
  }

  @override
  Stream<Planter?> getByIdStream(int id) {
    return _streamManager
        .watchFirst(
          (box) => box.watchFirstQuery(PlanterEntity_.dbId.equals(id)),
        )
        .map((e) => e?.toModel());
  }

  @override
  Future<Planter?> getById(int id) {
    return _box.buildQuery(PlanterEntity_.dbId.equals(id)).mapFirst((e) => e?.toModel());
  }

  @override
  Future<Planter?> getPlanterByNickname(String nickname) {
    return _box.buildQuery(PlanterEntity_.nickname.equals(nickname)).mapFirst((e) => e?.toModel());
  }

  @override
  Future<void> delete(Planter planter) async {
    _box.remove(planter.internalId);
  }

  @override
  Future<void> deleteById(int id) async {
    _box.remove(id);
  }

  @override
  Future<void> save(Planter planter) async {
    await _box.putAsync(planter.toEntity());
  }

  @override
  Future<void> clearSyncing() async {
    final entities = _box
        .buildQuery(PlanterEntity_.syncStatusOB.oneOf([
          SyncStatus.inserting.dbValue,
          SyncStatus.updating.dbValue,
          SyncStatus.changedBeforeInsert.dbValue,
        ]))
        .find();
    _box.putMany(entities.mapList((e) => e..syncStatus = e.syncStatus.previous));
  }

  @override
  Future<List<Planter>> getWaitingConfirm() {
    return _box
        .buildQuery(PlanterEntity_.syncStatusOB.equals(SyncStatus.waitingConfirmed.dbValue))
        .queryMap((e) => e.toModel());
  }

  @override
  Future<bool> hasPlanterId(String id) async {
    return _box.buildQuery(PlanterEntity_.planterId.equals(id)).findFirst() != null;
  }

  @override
  Future<void> markAllAsInactive() async {
    final entities = _box.buildQuery(PlanterEntity_.isActive.equals(true)).find();
    _box.putMany(entities.mapList((e) => e..isActive = false));
  }
}
