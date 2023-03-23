import 'dart:async';

abstract class BackgroundSyncService {
  Completer getCompleter();

  Future<void> syncAll();
}
