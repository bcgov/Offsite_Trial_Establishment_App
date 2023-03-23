import 'package:offsite_trial_establishment_app/domain/models/info/planting.dart';

extension PlantingExt on Planting {
  bool isChanged(Planting second) {
    return second.copyWith(
          plantingId: plantingId,
          syncStatus: syncStatus,
          trial: trial?.copyWith(id: second.trial?.id ?? ''),
          planter: planter,
        ) !=
        this;
  }
}
