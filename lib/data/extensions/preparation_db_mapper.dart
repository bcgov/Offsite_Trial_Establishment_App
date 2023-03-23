import 'package:offsite_trial_establishment_app/domain/models/info/preparation.dart';

extension PreparationMapper on Preparation {
  int get dbValue {
    switch (this) {
      case Preparation.spotBurn:
        return 1;
      case Preparation.mechanicalAndSpotBurn:
        return 2;
      case Preparation.mMechanical:
        return 3;
      case Preparation.grassSeeded:
        return 4;
      case Preparation.chemical:
        return 5;
      case Preparation.broadcastBurn:
        return 6;
    }
  }
}

extension IntPreparationMapper on int {
  Preparation? get preparationValue {
    switch (this) {
      case 1:
        return Preparation.spotBurn;
      case 2:
        return Preparation.mechanicalAndSpotBurn;
      case 3:
        return Preparation.mMechanical;
      case 4:
        return Preparation.grassSeeded;
      case 5:
        return Preparation.chemical;
      case 6:
        return Preparation.broadcastBurn;
      default:
        return null;
    }
  }
}
