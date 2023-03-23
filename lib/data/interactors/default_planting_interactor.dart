import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/utils/uuid_utils.dart';
import 'package:offsite_trial_establishment_app/data/extensions/planting_ext.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status.dart';
import 'package:offsite_trial_establishment_app/domain/interactors/planting_interactor.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/planting.dart';
import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';
import 'package:offsite_trial_establishment_app/domain/repositories/planter/local_planter_repository.dart';
import 'package:offsite_trial_establishment_app/domain/repositories/planting/local_planting_repository.dart';
import 'package:offsite_trial_establishment_app/domain/repositories/planting/remote_planting_repository.dart';
import 'package:offsite_trial_establishment_app/domain/services/validation_service.dart';

@LazySingleton(as: PlantingInteractor)
class DefaultPlantingInteractor extends PlantingInteractor {
  final LocalPlantingRepository _localRepository;
  final RemotePlantingRepository _remoteRepository;
  final LocalPlanterRepository _planterRepository;
  final ValidationService _validationService;

  DefaultPlantingInteractor(
    this._localRepository,
    this._remoteRepository,
    this._planterRepository,
    this._validationService,
  );

  @override
  Stream<List<Planting>> getUnsynced() {
    return _localRepository.getUnsynced();
  }

  @override
  Future<void> savePlanting(Planting planting) async {
    await _validationService.validationPlanting(planting);
    final planter = planting.planter ?? (await _planterRepository.getActivePlanter().first);
    await _localRepository.save(planting.copyWith(syncStatus: planting.syncStatus.afterChange, planter: planter));
  }

  @override
  Stream<List<int>> getInternalIdsInOrder() {
    return _localRepository.getInternalIdsInOrder();
  }

  @override
  Stream<Planting?> getPlantingById(int id) {
    return _localRepository.getByIdStream(id);
  }

  @override
  Future<Planting?> syncPlanting(int id) async {
    await markAsSyncing(id);
    var planting = await _localRepository.getById(id);
    if (planting == null) return null;
    if (planting.syncStatus.isFirstSync) {
      while (!await _remoteRepository.canSaveWithId(planting!.plantingId)) {
        planting = planting.copyWith(plantingId: await generateUniqueId());
      }
    }
    return await _remoteRepository.save(planting, () => markAsSynced(planting!));
  }

  @override
  Future<Planting?> getLast() {
    return _localRepository.getLast();
  }

  @override
  Future<String> generateUniqueId() async {
    var result = UuidUtils.generate();
    while (await _localRepository.hasPlantingId(result)) {
      result = UuidUtils.generate();
    }
    return result;
  }

  @override
  Future<Planting?> markAsSynced(Planting planting) async {
    final current = await _localRepository.getById(planting.internalId);
    if (current == null) return null;
    final changed = current.isChanged(planting);
    _localRepository.save(current.copyWith(
      plantingId: planting.plantingId,
      syncStatus: changed ? SyncStatus.waitingUpdate : SyncStatus.waitingConfirmed,
    ));
    return changed ? null : planting;
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
  Future<List<Planting>> getWaitingConfirm() async {
    return await _localRepository.getWaitingConfirm();
  }
}
