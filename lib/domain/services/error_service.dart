abstract class ErrorService {
  Future<void> catchError(
    dynamic error,
    StackTrace? stackTrace, {
    required bool showDialog,
  });
}
