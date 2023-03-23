import 'package:offsite_trial_establishment_app/domain/models/planter.dart';

extension PlanterExt on Planter {
  bool isChanged(Planter second) {
    return second.copyWith(id: id, syncStatus: syncStatus) != this;
  }
}
