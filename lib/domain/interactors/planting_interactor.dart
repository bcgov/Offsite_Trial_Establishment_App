import 'package:offsite_trial_establishment_app/domain/models/info/planting.dart';

abstract class PlantingInteractor {
  Stream<List<Planting>> getUnsynced();

  Stream<List<int>> getInternalIdsInOrder();

  Future<Planting?> getLast();

  Stream<Planting?> getPlantingById(int id);

  Future<String> generateUniqueId();

  Future<void> savePlanting(Planting planting);

  Future<Planting?> syncPlanting(int id);

  Future<Planting?> markAsSynced(Planting planting);

  Future<void> markAsConfirmed(int id);

  Future<void> markAsSyncing(int id);

  Future<void> clearSyncing();

  Future<List<Planting>> getWaitingConfirm();
}
