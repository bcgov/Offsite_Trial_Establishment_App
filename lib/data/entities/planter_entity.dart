import 'package:objectbox/objectbox.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status_db_mapper.dart';
import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';

@Entity()
class PlanterEntity {
  @Id(assignable: true)
  int dbId;
  @Unique()
  final String planterId;
  final String nickname;
  final String lastName;
  final String firstName;
  final String email;
  final String phone;
  final String organization;
  @Transient()
  SyncStatus syncStatus = SyncStatus.waitingInsert;
  bool isActive;

  PlanterEntity({
    required this.planterId,
    required this.nickname,
    required this.lastName,
    required this.firstName,
    required this.email,
    required this.phone,
    required this.organization,
    required this.isActive,
  }) : dbId = 1;

  PlanterEntity.create({
    required this.dbId,
    required this.planterId,
    required this.nickname,
    required this.lastName,
    required this.firstName,
    required this.email,
    required this.phone,
    required this.organization,
    required this.syncStatus,
    required this.isActive,
  });

  int? get syncStatusOB {
    return syncStatus.dbValue;
  }

  set syncStatusOB(int? value) {
    syncStatus = value?.syncStatusValue ?? SyncStatus.waitingInsert;
  }
}
