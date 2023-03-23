import 'package:offsite_trial_establishment_app/domain/models/trial.dart';

abstract class TrialInteractor {
  Stream<List<Trial>> getAll();

  Stream<List<Trial>> getUnsynced();

  Stream<Trial?> getTrialById(int id);

  Stream<List<int>> getInternalIdsInOrder();

  Future<Trial> saveTrial(Trial trial);

  Future<Trial?> syncTrial(int id);

  Future<String> generateUniqueId();

  Future<Trial?> markAsSynced(Trial trial);

  Future<void> markAsConfirmed(int id);

  Future<void> markAsSyncing(int id);

  Future<void> clearSyncing();

  Future<List<Trial>> getWaitingConfirm();
}
