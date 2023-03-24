import 'dart:math';

import 'package:location/location.dart';
import 'package:offsite_trial_establishment_app/common/constants/accuracy.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/location.dart' as model;

extension LocationDataMapper on LocationData {
  model.Location toModel() {
    return model.Location(
      latitude: round(latitude, Accuracy.latitude),
      longitude: round(longitude, Accuracy.longitude),
      elevation: altitude?.round(),
    );
  }

  double round(double? value, int accuracy) {
    final tenInAccuracy = pow(10, accuracy);
    return ((value ?? 0) * tenInAccuracy).round() / tenInAccuracy;
  }
}
