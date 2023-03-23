import 'package:offsite_trial_establishment_app/domain/models/trial.dart';

abstract class LocalTrialRepository {
  Stream<List<Trial>> getAll();

  Stream<List<Trial>> getUnsynced();

  Stream<List<int>> getInternalIdsInOrder();

  Stream<Trial?> getByIdStream(int id);

  Future<Trial?> getById(int id);

  Future<Trial> save(Trial trial);

  Future<void> delete(Trial trial);

  Future<void> deleteById(int id);

  Future<bool> hasTrialId(String id);

  Future<bool> hasCompanyId(String id);

  Future<void> clearSyncing();

  Future<List<Trial>> getWaitingConfirm();
}
