import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';

extension SyncStatusExt on SyncStatus {
  SyncStatus get previous {
    switch (this) {
      case SyncStatus.updating:
        return SyncStatus.waitingUpdate;
      case SyncStatus.inserting:
        return SyncStatus.waitingInsert;
      case SyncStatus.changedBeforeInsert:
        return SyncStatus.waitingInsert;
      default:
        return this;
    }
  }

  SyncStatus get afterChange {
    switch (this) {
      case SyncStatus.inserting:
        return SyncStatus.waitingInsert;
      case SyncStatus.waitingInsert:
        return SyncStatus.waitingInsert;
      case SyncStatus.changedBeforeInsert:
        return SyncStatus.waitingInsert;
      default:
        return SyncStatus.waitingUpdate;
    }
  }

  bool get isFirstSync {
    switch (this) {
      case SyncStatus.inserting:
        return true;
      case SyncStatus.waitingInsert:
        return true;
      default:
        return false;
    }
  }
}
