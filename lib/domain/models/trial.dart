import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offsite_trial_establishment_app/domain/models/company.dart';
import 'package:offsite_trial_establishment_app/domain/models/planter.dart';
import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';

part 'trial.freezed.dart';
part 'trial.g.dart';

@freezed
class Trial with _$Trial {
  const factory Trial({
    required int internalId,
    required String id,
    required String nickname,
    required Company? contact,
    required String objective,
    required SyncStatus syncStatus,
    required DateTime modifiedDate,
    required Planter? planter,
  }) = _Trial;

  factory Trial.create() => Trial(
    internalId: 0,
        id: '',
        nickname: '',
        contact: Company.create(),
        objective: '',
        syncStatus: SyncStatus.waitingInsert,
        modifiedDate: DateTime.now(),
        planter: null,
      );

  factory Trial.fromJson(Map<String, dynamic> json) => _$TrialFromJson(json);
}
