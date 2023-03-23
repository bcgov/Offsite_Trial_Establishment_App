import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:offsite_trial_establishment_app/data/extensions/location_data_mapper.dart';
import 'package:offsite_trial_establishment_app/domain/models/errors.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/location.dart' as model;
import 'package:offsite_trial_establishment_app/domain/models/permissions.dart' as model;
import 'package:offsite_trial_establishment_app/domain/services/location_service.dart';

@LazySingleton(as: LocationService)
class DefaultLocationService extends LocationService {
  final _location = Location();
  late final _stream = _location.onLocationChanged.asBroadcastStream();
  StreamSubscription? _sub;
  PermissionStatus? _permissionGranted;
  bool _serviceEnabled = true;
  model.Location? _locationData;

  DefaultLocationService() {
    _initService();
  }

  @override
  Stream<model.Location> getLocationStream([bool checkPermission = false]) {
    if (checkPermission) _validatePermission();
    return _stream.map((event) => event.toModel());
  }

  @override
  Future<model.Location> getNowLocation() async {
    await _validatePermission();
    return _locationData ?? (await _location.getLocation()).toModel();
  }

  Future<void> _validatePermission() async {
    if (!await _requestPermission()) {
      throw PermissionException(model.Permission.location);
    }
  }

  Future<void> _initService() async {
    if (await _requestPermission()) {
      _sub = _stream.listen((event) => _locationData = event.toModel());
    }
  }

  Future<bool> _requestPermission() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }
}
