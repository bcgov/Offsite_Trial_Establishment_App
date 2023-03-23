import 'package:offsite_trial_establishment_app/domain/models/info/smr.dart';

extension SmrMapper on Smr {
  int get dbValue {
    switch (this) {
      case Smr.veryXeric:
        return 1;
      case Smr.xeric:
        return 2;
      case Smr.subxeric:
        return 3;
      case Smr.submesic:
        return 4;
      case Smr.mesic:
        return 5;
      case Smr.subhygric:
        return 6;
      case Smr.hygric:
        return 7;
      case Smr.subhydric:
        return 8;
      case Smr.hydric:
        return 9;
    }
  }
}

extension IntSmrMapper on int {
  Smr? get smrValue {
    switch (this) {
      case 1:
        return Smr.veryXeric;
      case 2:
        return Smr.xeric;
      case 3:
        return Smr.subxeric;
      case 4:
        return Smr.submesic;
      case 5:
        return Smr.mesic;
      case 6:
        return Smr.subhygric;
      case 7:
        return Smr.hygric;
      case 8:
        return Smr.subhydric;
      case 9:
        return Smr.hydric;
      default:
        return null;
    }
  }
}
