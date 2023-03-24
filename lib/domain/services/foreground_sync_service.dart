import 'package:offsite_trial_establishment_app/domain/models/sending_status.dart';

abstract class ForegroundSyncService {
  Stream<SendingStatus> getStatus();

  Future<void> reload();

  Future<void> retrySending();

  Future<void> cancel();
}
