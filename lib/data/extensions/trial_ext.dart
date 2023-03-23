import 'package:offsite_trial_establishment_app/domain/models/trial.dart';

extension TrialExt on Trial {
  bool isChanged(Trial? second) {
    return second?.copyWith(
          id: id,
          syncStatus: syncStatus,
          planter: planter,
        ) !=
        this;
  }
}
