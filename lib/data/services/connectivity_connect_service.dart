import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/domain/services/connect_service.dart';

@LazySingleton(as: ConnectService)
class ConnectivityConnectService extends ConnectService {
  final Connectivity _connectivity;

  ConnectivityConnectService(
    this._connectivity,
  );

  @override
  Future<bool> hasConnection() async {
    return _mapResult(await _connectivity.checkConnectivity());
  }

  @override
  Stream<bool> hasConnectionStream() {
    return _connectivity.onConnectivityChanged.map(_mapResult);
  }

  bool _mapResult(ConnectivityResult result) => result != ConnectivityResult.none;
}
