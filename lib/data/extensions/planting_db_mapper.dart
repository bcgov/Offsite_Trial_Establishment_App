import 'package:offsite_trial_establishment_app/data/entities/planting_entity.dart';
import 'package:offsite_trial_establishment_app/data/extensions/planter_db_mapper.dart';
import 'package:offsite_trial_establishment_app/data/extensions/trial_db_mapper.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/location.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/planting.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/seedlings.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/site.dart';

extension PlantingEntityMapper on PlantingEntity {
  Planting toModel() => Planting(
        internalId: dbId,
        plantingId: plantingId,
        blockId: blockId,
        date: date,
        location: _location,
        photoPaths: photos,
        site: _site,
        seedlings: _seedlings,
        syncStatus: syncStatus,
        trial: trial.target?.toModel(),
        planter: planter.target?.toModel(),
        modifiedDate: modifiedDate,
      );

  Location get _location => Location(
        latitude: latitude,
        longitude: longitude,
        elevation: elevation,
      );

  Site get _site => Site(
        smr: smr,
        snr: snr,
        soil: soil,
        preparation: preparation,
        series: series,
      );

  Seedlings get _seedlings => Seedlings(
        count: count,
        species: species,
        seedlot: seedlot,
        spacing: spacing,
        notes: notes,
      );
}

extension PlantingMapper on Planting {
  PlantingEntity toEntity() => PlantingEntity.create(
        dbId: internalId,
        plantingId: plantingId,
        blockId: blockId,
        trialDbId: trial?.internalId,
        date: date,
        longitude: location?.longitude,
        latitude: location?.latitude,
        elevation: location?.elevation,
        count: seedlings?.count ?? -1,
        species: seedlings?.species,
        seedlot: seedlings?.seedlot ?? '',
        spacing: seedlings?.spacing ?? -1,
        notes: seedlings?.notes ?? '',
        series: site?.series ?? '',
        smr: site?.smr,
        snr: site?.snr,
        soil: site?.soil,
        preparation: site?.preparation,
        photos: photoPaths,
        syncStatus: syncStatus,
        planterDbId: planter?.internalId,
        modifiedDate: modifiedDate,
      );
}
