import 'package:offsite_trial_establishment_app/domain/models/info/planting.dart';

abstract class RemotePlantingRepository {
  Future<Planting?> save(Planting planting, Future<Planting?> Function() onSave);

  Future<bool> canSaveWithId(String id);
}
