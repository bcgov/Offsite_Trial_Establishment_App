abstract class ConnectService {
  Stream<bool> hasConnectionStream();

  Future<bool> hasConnection();
}
