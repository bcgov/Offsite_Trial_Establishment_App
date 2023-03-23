import 'package:offsite_trial_establishment_app/domain/models/trial.dart';

abstract class RemoteTrialRepository {
  Future<Trial?> save(Trial trial, Future<Trial?> Function() onSave);

  Future<bool> canSaveWithId(String id);
}
