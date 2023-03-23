import 'package:offsite_trial_establishment_app/domain/models/info/planting.dart';

abstract class LocalPlantingRepository {
  Stream<List<Planting>> getUnsynced();

  Stream<List<int>> getInternalIdsInOrder();

  Stream<Planting?> getByIdStream(int id);

  Future<Planting?> getById(int id);

  Future<Planting?> getLast();

  Future<void> save(Planting planting);

  Future<void> delete(Planting planting);

  Future<void> deleteById(int id);

  Future<bool> hasPlantingId(String plantingId);

  Future<void> clearSyncing();

  Future<List<Planting>> getWaitingConfirm();
}
