import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';

extension SyncStatusMapper on SyncStatus {
  int get dbValue {
    switch (this) {
      case SyncStatus.waitingInsert:
        return 1;
      case SyncStatus.inserting:
        return 2;
      case SyncStatus.waitingConfirmed:
        return 3;
      case SyncStatus.confirmed:
        return 4;
      case SyncStatus.waitingUpdate:
        return 5;
      case SyncStatus.updating:
        return 6;
      case SyncStatus.changedBeforeInsert:
        return 7;
    }
  }
}

extension IntSyncStatusMapper on int {
  SyncStatus? get syncStatusValue {
    switch (this) {
      case 1:
        return SyncStatus.waitingInsert;
      case 2:
        return SyncStatus.inserting;
      case 3:
        return SyncStatus.waitingConfirmed;
      case 4:
        return SyncStatus.confirmed;
      case 5:
        return SyncStatus.waitingUpdate;
      case 6:
        return SyncStatus.updating;
      case 7:
        return SyncStatus.changedBeforeInsert;
      default:
        return null;
    }
  }
}
