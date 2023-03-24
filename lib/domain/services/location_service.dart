import 'package:offsite_trial_establishment_app/domain/models/info/location.dart';

abstract class LocationService {
  Stream<Location> getLocationStream([bool checkPermission = false]);

  Future<Location> getNowLocation();
}
