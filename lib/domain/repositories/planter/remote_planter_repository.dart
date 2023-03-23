import 'package:offsite_trial_establishment_app/domain/models/planter.dart';

abstract class RemotePlanterRepository {
  Future<Planter?> save(Planter planter, Future<Planter?> Function() onSave);

  Future<bool> canSaveWithId(String id);

  Future<String?> getIdByNickname(String nickname);
}
