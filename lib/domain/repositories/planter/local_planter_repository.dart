import 'package:offsite_trial_establishment_app/domain/models/planter.dart';

abstract class LocalPlanterRepository {
  Stream<Planter?> getActivePlanter();

  Stream<Planter?> getByIdStream(int id);

  Future<Planter?> getById(int id);

  Future<Planter?> getPlanterByNickname(String nickname);

  Future<void> save(Planter planter);

  Future<void> delete(Planter planter);

  Stream<List<Planter>> getUnsynced();

  Future<void> deleteById(int id);

  Future<void> clearSyncing();

  Future<List<Planter>> getWaitingConfirm();

  Future<bool> hasPlanterId(String id);

  Future<void> markAllAsInactive();
}
