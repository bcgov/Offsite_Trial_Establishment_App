import 'package:offsite_trial_establishment_app/domain/models/planter.dart';

abstract class PlanterInteractor {
  Stream<List<Planter>> getUnsynced();

  Stream<Planter?> getActivePlanter();

  Stream<Planter?> getPlanterById(int id);

  Future<Planter?> getPlanterByNickname(String nickname);

  Future<void> savePlanter(Planter planter);

  Future<Planter?> syncPlanter(int id);

  Future<Planter?> markAsSynced(Planter planter);

  Future<void> markAsConfirmed(int id);

  Future<void> markAsSyncing(int id);

  Future<void> clearSyncing();

  Future<List<Planter>> getWaitingConfirm();

  Future<String> generateUniqueId();

  Future<void> logout();
}
