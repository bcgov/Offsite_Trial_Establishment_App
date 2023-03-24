import 'package:objectbox/objectbox.dart';
import 'package:offsite_trial_establishment_app/data/entities/planter_entity.dart';
import 'package:offsite_trial_establishment_app/data/entities/trial_entity.dart';
import 'package:offsite_trial_establishment_app/data/extensions/preparation_db_mapper.dart';
import 'package:offsite_trial_establishment_app/data/extensions/smr_db_mapper.dart';
import 'package:offsite_trial_establishment_app/data/extensions/snr_db_mapper.dart';
import 'package:offsite_trial_establishment_app/data/extensions/soil_db_mapper.dart';
import 'package:offsite_trial_establishment_app/data/extensions/species_db_mapper.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status_db_mapper.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/preparation.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/smr.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/snr.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/soil.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/species.dart';
import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';

@Entity()
class PlantingEntity {
  @Id(assignable: true)
  int dbId;
  @Unique()
  final String plantingId;
  final String blockId;
  final ToOne<TrialEntity> trial;
  final DateTime date;
  final double? longitude;
  final double? latitude;
  final int? elevation;
  final String series;
  @Transient()
  Smr? smr;
  @Transient()
  Snr? snr;
  @Transient()
  Soil? soil;
  @Transient()
  Preparation? preparation;
  final int count;
  @Transient()
  Species? species;
  final String seedlot;
  final double spacing;
  final String notes;
  final List<String> photos;
  @Transient()
  SyncStatus syncStatus = SyncStatus.waitingInsert;
  final ToOne<PlanterEntity> planter;
  final DateTime modifiedDate;

  PlantingEntity({
    this.dbId = 0,
    required this.plantingId,
    required this.blockId,
    required this.date,
    required this.trial,
    required this.longitude,
    required this.latitude,
    required this.elevation,
    required this.photos,
    required this.series,
    required this.count,
    required this.seedlot,
    required this.spacing,
    required this.notes,
    required this.planter,
    required this.modifiedDate,
  });

  PlantingEntity.create({
    this.dbId = 0,
    required this.plantingId,
    required this.blockId,
    required int? trialDbId,
    required this.date,
    required this.longitude,
    required this.latitude,
    required this.elevation,
    required this.series,
    required this.smr,
    required this.snr,
    required this.soil,
    required this.preparation,
    required this.count,
    required this.species,
    required this.seedlot,
    required this.spacing,
    required this.notes,
    required this.photos,
    required this.syncStatus,
    required this.modifiedDate,
    required int? planterDbId,
  })  : trial = ToOne(targetId: trialDbId),
        planter = ToOne(targetId: planterDbId);

  int? get speciesOB {
    return species?.dbValue;
  }

  set speciesOB(int? value) {
    species = value?.speciesValue;
  }

  int? get smrOB {
    return smr?.dbValue;
  }

  set smrOB(int? value) {
    smr = value?.smrValue;
  }

  int? get snrOB {
    return snr?.dbValue;
  }

  set snrOB(int? value) {
    snr = value?.snrValue;
  }

  int? get soilOB {
    return soil?.dbValue;
  }

  set soilOB(int? value) {
    soil = value?.soilValue;
  }

  int? get preparationOB {
    return preparation?.dbValue;
  }

  set preparationOB(int? value) {
    preparation = value?.preparationValue;
  }

  int? get syncStatusOB {
    return syncStatus.dbValue;
  }

  set syncStatusOB(int? value) {
    syncStatus = value?.syncStatusValue ?? SyncStatus.waitingInsert;
  }
}
