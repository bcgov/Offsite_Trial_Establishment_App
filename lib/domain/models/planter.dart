import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';

part 'planter.freezed.dart';
part 'planter.g.dart';

@freezed
class Planter with _$Planter {
  const factory Planter({
    required int internalId,
    required String id,
    required String nickname,
    required String lastName,
    required String firstName,
    required String email,
    required String phone,
    required String organization,
    required SyncStatus syncStatus,
    required bool isActive,
  }) = _Planter;

  factory Planter.create() => const Planter(
    internalId: 0,
        id: '',
        nickname: '',
        lastName: '',
        firstName: '',
        email: '',
        phone: '',
        organization: '',
        syncStatus: SyncStatus.waitingInsert,
        isActive: true,
      );

  factory Planter.fromJson(Map<String, dynamic> json) => _$PlanterFromJson(json);
}
