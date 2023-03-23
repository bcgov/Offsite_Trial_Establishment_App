import 'package:offsite_trial_establishment_app/domain/models/info/snr.dart';

extension SnpMapper on Snr {
  int get dbValue {
    switch (this) {
      case Snr.veryPoor:
        return 1;
      case Snr.poor:
        return 2;
      case Snr.medium:
        return 3;
      case Snr.rich:
        return 4;
      case Snr.veryRich:
        return 5;
    }
  }
}

extension IntSnpMapper on int {
  Snr? get snrValue {
    switch (this) {
      case 1:
        return Snr.veryPoor;
      case 2:
        return Snr.poor;
      case 3:
        return Snr.medium;
      case 4:
        return Snr.rich;
      case 5:
        return Snr.veryRich;
    }
    return null;
  }
}
