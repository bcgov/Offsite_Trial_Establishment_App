import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/utils/uuid_utils.dart';
import 'package:offsite_trial_establishment_app/data/extensions/planter_ext.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status.dart';
import 'package:offsite_trial_establishment_app/domain/interactors/planter_interactor.dart';
import 'package:offsite_trial_establishment_app/domain/models/planter.dart';
import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';
import 'package:offsite_trial_establishment_app/domain/repositories/planter/local_planter_repository.dart';
import 'package:offsite_trial_establishment_app/domain/repositories/planter/remote_planter_repository.dart';
import 'package:offsite_trial_establishment_app/domain/services/validation_service.dart';

@LazySingleton(as: PlanterInteractor)
class DefaultPlanterInteractor extends PlanterInteractor {
  final LocalPlanterRepository _localRepository;
  final RemotePlanterRepository _remoteRepository;
  final ValidationService _validationService;

  DefaultPlanterInteractor(
    this._localRepository,
    this._validationService,
    this._remoteRepository,
  );

  @override
  Stream<List<Planter>> getUnsynced() {
    return _localRepository.getUnsynced();
  }

  @override
  Stream<Planter?> getActivePlanter() {
    return _localRepository.getActivePlanter();
  }

  @override
  Stream<Planter?> getPlanterById(int id) {
    return _localRepository.getByIdStream(id);
  }

  @override
  Future<Planter?> getPlanterByNickname(String nickname) {
    return _localRepository.getPlanterByNickname(nickname);
  }

  @override
  Future<void> savePlanter(Planter planter) async {
    await _validationService.validationPlanter(planter);
    await _localRepository.save(planter.copyWith(syncStatus: planter.syncStatus.afterChange));
  }

  @override
  Future<Planter?> syncPlanter(int id) async {
    await markAsSyncing(id);
    var planter = await _localRepository.getById(id);
    if (planter == null) return null;
    if (planter.syncStatus.isFirstSync) {
      final id = await _remoteRepository.getIdByNickname(planter.nickname);
      if (id != null) {
        planter = planter.copyWith(id: id, syncStatus: SyncStatus.updating);
        _localRepository.save(planter);
      } else {
        while (!await _remoteRepository.canSaveWithId(planter!.id)) {
          planter = planter.copyWith(id: await generateUniqueId());
        }
      }
    }
    return await _remoteRepository.save(planter, () => markAsSynced(planter!));
  }

  @override
  Future<Planter?> markAsSynced(Planter planter) async {
    final current = await _localRepository.getById(planter.internalId);
    if (current == null) return null;
    final changed = current.isChanged(planter);
    _localRepository.save(current.copyWith(
      id: planter.id,
      syncStatus: changed ? SyncStatus.waitingUpdate : SyncStatus.waitingConfirmed,
    ));
    return changed ? null : planter;
  }

  @override
  Future<void> markAsConfirmed(int id) async {
    final current = await _localRepository.getById(id);
    if (current?.syncStatus == SyncStatus.waitingConfirmed) {
      _localRepository.save(current!.copyWith(
        syncStatus: SyncStatus.confirmed,
      ));
    }
  }

  @override
  Future<void> markAsSyncing(int id) async {
    final current = await _localRepository.getById(id);
    switch (current?.syncStatus) {
      case SyncStatus.waitingInsert:
        _localRepository.save(current!.copyWith(
          syncStatus: SyncStatus.inserting,
        ));
        break;
      case SyncStatus.waitingUpdate:
        _localRepository.save(current!.copyWith(
          syncStatus: SyncStatus.updating,
        ));
        break;
      default:
        break;
    }
  }

  @override
  Future<void> clearSyncing() async {
    await _localRepository.clearSyncing();
  }

  @override
  Future<List<Planter>> getWaitingConfirm() async {
    return await _localRepository.getWaitingConfirm();
  }

  @override
  Future<String> generateUniqueId() async {
    var result = UuidUtils.generate();
    while (await _localRepository.hasPlanterId(result)) {
      result = UuidUtils.generate();
    }
    return result;
  }

  @override
  Future<void> logout() async {
    await _localRepository.markAllAsInactive();
  }
}
