import 'package:objectbox/objectbox.dart';
import 'package:offsite_trial_establishment_app/data/entities/company_entity.dart';
import 'package:offsite_trial_establishment_app/data/entities/planter_entity.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status_db_mapper.dart';
import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';

@Entity()
class TrialEntity {
  @Id(assignable: true)
  int dbId;
  @Unique()
  final String trialId;
  final String nickname;
  final ToOne<CompanyEntity> contact;
  final String objective;
  final DateTime modifiedDate;
  @Transient()
  SyncStatus syncStatus = SyncStatus.waitingInsert;
  final ToOne<PlanterEntity> planter;

  TrialEntity({
    this.dbId = 0,
    required this.trialId,
    required this.nickname,
    required this.contact,
    required this.objective,
    required this.modifiedDate,
    required this.planter,
  });

  TrialEntity.create({
    this.dbId = 0,
    required this.trialId,
    required this.nickname,
    required int? contactId,
    required this.objective,
    required this.syncStatus,
    required this.modifiedDate,
    required int? planterId,
  })  : contact = ToOne(targetId: contactId),
        planter = ToOne(targetId: planterId);

  int? get syncStatusOB {
    return syncStatus.dbValue;
  }

  set syncStatusOB(int? value) {
    syncStatus = value?.syncStatusValue ?? SyncStatus.waitingInsert;
  }
}
