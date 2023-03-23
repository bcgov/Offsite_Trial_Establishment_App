import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/utils/uuid_utils.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status.dart';
import 'package:offsite_trial_establishment_app/data/extensions/trial_ext.dart';
import 'package:offsite_trial_establishment_app/domain/interactors/trial_interactor.dart';
import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';
import 'package:offsite_trial_establishment_app/domain/models/trial.dart';
import 'package:offsite_trial_establishment_app/domain/repositories/planter/local_planter_repository.dart';
import 'package:offsite_trial_establishment_app/domain/repositories/trial/local_trial_repository.dart';
import 'package:offsite_trial_establishment_app/domain/repositories/trial/remote_trial_repository.dart';
import 'package:offsite_trial_establishment_app/domain/services/validation_service.dart';

@LazySingleton(as: TrialInteractor)
class DefaultTrialInteractor extends TrialInteractor {
  final LocalTrialRepository _localRepository;
  final RemoteTrialRepository _remoteRepository;
  final LocalPlanterRepository _planterRepository;
  final ValidationService _validationService;

  DefaultTrialInteractor(
    this._localRepository,
    this._planterRepository,
    this._validationService,
    this._remoteRepository,
  );

  @override
  Stream<List<Trial>> getAll() {
    return _localRepository.getAll();
  }

  @override
  Stream<List<Trial>> getUnsynced() {
    return _localRepository.getUnsynced();
  }

  @override
  Stream<List<int>> getInternalIdsInOrder() {
    return _localRepository.getInternalIdsInOrder();
  }

  @override
  Stream<Trial?> getTrialById(int id) {
    return _localRepository.getByIdStream(id);
  }

  @override
  Future<Trial> saveTrial(Trial trial) async {
    await _validationService.validationTrial(trial);
    final planter = trial.planter ?? (await _planterRepository.getActivePlanter().first);
    return await _localRepository.save(trial.copyWith(syncStatus: trial.syncStatus.afterChange, planter: planter));
  }

  @override
  Future<Trial?> syncTrial(int id) async {
    await markAsSyncing(id);
    var trial = await _localRepository.getById(id);
    if (trial == null) return null;
    if (trial.syncStatus.isFirstSync) {
      while (!await _remoteRepository.canSaveWithId(trial!.id)) {
        trial = trial.copyWith(id: await generateUniqueId());
      }
    }
    return await _remoteRepository.save(trial, () => markAsSynced(trial!));
  }

  @override
  Future<String> generateUniqueId() async {
    var result = UuidUtils.generate();
    while (await _localRepository.hasTrialId(result)) {
      result = UuidUtils.generate();
    }
    return result;
  }

  @override
  Future<Trial?> markAsSynced(Trial trial) async {
    final current = await _localRepository.getById(trial.internalId);
    if (current == null) return null;
    final changed = current.isChanged(trial);
    _localRepository.save(current.copyWith(
      id: trial.id,
      syncStatus: changed ? SyncStatus.waitingUpdate : SyncStatus.waitingConfirmed,
    ));
    return changed ? null : trial;
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
  Future<List<Trial>> getWaitingConfirm() async {
    return await _localRepository.getWaitingConfirm();
  }

  Future<String> _generateUniqueContactId() async {
    var result = UuidUtils.generate();
    while (await _localRepository.hasCompanyId(result)) {
      result = UuidUtils.generate();
    }
    return result;
  }
}
