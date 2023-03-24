import 'package:offsite_trial_establishment_app/domain/models/info/soil.dart';

extension SoilMapper on Soil {
  int get dbValue {
    switch (this) {
      case Soil.compactedMorainalMaterial:
        return 1;
      case Soil.stronglyCementedHorizon:
        return 2;
      case Soil.lithicContact:
        return 3;
      case Soil.excessiveMoisture:
        return 4;
      case Soil.permafrost:
        return 5;
      case Soil.fragmental:
        return 6;
      case Soil.snowAccumulation:
        return 7;
      case Soil.wind:
        return 8;
      case Soil.saltSpray:
        return 9;
      case Soil.frost:
        return 10;
      case Soil.insolation:
        return 11;
      case Soil.coldAirDrainage:
        return 12;
    }
  }
}

extension IntSoilMapper on int {
  Soil? get soilValue {
    switch (this) {
      case 1:
        return Soil.compactedMorainalMaterial;
      case 2:
        return Soil.stronglyCementedHorizon;
      case 3:
        return Soil.lithicContact;
      case 4:
        return Soil.excessiveMoisture;
      case 5:
        return Soil.permafrost;
      case 6:
        return Soil.fragmental;
      case 7:
        return Soil.snowAccumulation;
      case 8:
        return Soil.wind;
      case 9:
        return Soil.saltSpray;
      case 10:
        return Soil.frost;
      case 11:
        return Soil.insolation;
      case 12:
        return Soil.coldAirDrainage;
      default:
        return null;
    }
  }
}
