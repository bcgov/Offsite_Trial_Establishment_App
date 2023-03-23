import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/location.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/seedlings.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/site.dart';
import 'package:offsite_trial_establishment_app/domain/models/planter.dart';
import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';
import 'package:offsite_trial_establishment_app/domain/models/trial.dart';

part 'planting.freezed.dart';
part 'planting.g.dart';

@freezed
class Planting with _$Planting {
  const factory Planting({
    required int internalId,
    required String plantingId,
    required String blockId,
    required DateTime date,
    required Location? location,
    required List<String> photoPaths,
    required Site? site,
    required Seedlings? seedlings,
    required Trial? trial,
    required Planter? planter,
    required SyncStatus syncStatus,
    required DateTime modifiedDate,
  }) = _Planting;

  factory Planting.create({@Default(null) Planting? from}) => Planting(
        internalId: 0,
        plantingId: '',
        blockId: '',
        date: DateTime.now(),
        location: null,
        photoPaths: [],
        site: null,
        seedlings: from?.seedlings?.copyWith(count: -1, notes: '') ?? Seedlings.create(),
        trial: from?.trial,
        planter: null,
        syncStatus: SyncStatus.waitingInsert,
        modifiedDate: DateTime.now(),
      );

  factory Planting.fromJson(Map<String, dynamic> json) => _$PlantingFromJson(json);
}
