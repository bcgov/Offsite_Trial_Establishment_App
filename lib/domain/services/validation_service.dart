import 'package:offsite_trial_establishment_app/domain/models/info/planting.dart';
import 'package:offsite_trial_establishment_app/domain/models/planter.dart';
import 'package:offsite_trial_establishment_app/domain/models/trial.dart';

abstract class ValidationService {
  Future<void> validationPlanter(Planter planter);

  Future<void> validationTrial(Trial trial);

  Future<void> validationPlanting(Planting planting);
}
