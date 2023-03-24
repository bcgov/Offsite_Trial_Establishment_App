class PlantingTable {
  final table = 'planting_info';
  final column = PlantingColumn();
  final values = PlantingValues();

  late final queryById = '''
SELECT ${column.id} FROM $table WHERE ${column.id} = @${values.id};
''';

  late final insertQuery = '''
INSERT INTO $table (${column.id}, ${column.planterId}, ${column.trialId}, ${column.trialContactId}, ${column.blockId}, ${column.date}, ${column.latitude}, ${column.longitude}, ${column.elevation}, ${column.siteSeries}, ${column.smr}, ${column.snr}, ${column.soilSiteFactors}, ${column.sitePrep}, ${column.species}, ${column.seedlot}, ${column.treesNumber}, ${column.spacing}, ${column.plantingNotes}) 
VALUES (@${values.id}, @${values.planterId}, @${values.trialId}, @${values.trialContactId}, @${values.blockId}, @${values.date}, @${values.latitude}, @${values.longitude}, @${values.elevation}, @${values.siteSeries}, @${values.smr}, @${values.snr}, @${values.soilSiteFactors}, @${values.sitePrep}, @${values.species}, @${values.seedlot}, @${values.treesNumber}, @${values.spacing}, @${values.plantingNotes});
''';

  late final updateQuery = '''
  UPDATE $table SET 
  ${column.trialId} = @${values.trialId},
  ${column.planterId} = @${values.planterId},
  ${column.trialContactId} = @${values.trialContactId},
  ${column.blockId} = @${values.blockId},
  ${column.date} = @${values.date},
  ${column.latitude} = @${values.latitude},
  ${column.longitude} = @${values.longitude},
  ${column.elevation} = @${values.elevation},
  ${column.siteSeries} = @${values.siteSeries},
  ${column.smr} = @${values.smr},
  ${column.snr} = @${values.snr},
  ${column.soilSiteFactors} = @${values.soilSiteFactors},
  ${column.sitePrep} = @${values.sitePrep},
  ${column.species} = @${values.species},
  ${column.seedlot} = @${values.seedlot},
  ${column.treesNumber} = @${values.treesNumber},
  ${column.spacing} = @${values.spacing},
  ${column.plantingNotes} = @${values.plantingNotes}
  WHERE ${column.id} = @${values.id};
''';
}

class PlantingColumn {
  final id = 'plantation_id';
  final trialId = 'trial_id';
  final planterId = 'planter_id';
  final trialContactId = 'trial_contact_id';
  final blockId = 'block_id';
  final date = 'date_established';
  final latitude = 'latitude';
  final longitude = 'longitude';
  final elevation = 'elevation';
  final siteSeries = 'site_series';
  final smr = 'smr';
  final snr = 'snr';
  final soilSiteFactors = 'soil_site_factors';
  final sitePrep = 'site_prep';
  final species = 'species';
  final seedlot = 'seedlot';
  final treesNumber = 'trees_number';
  final spacing = 'spacing';
  final plantingNotes = 'planting_notes';
}

class PlantingValues {
  final id = 'id';
  final trialId = 'trialId';
  final planterId = 'planterId';
  final trialContactId = 'trialContactId';
  final blockId = 'blockId';
  final date = 'date';
  final latitude = 'latitude';
  final longitude = 'longitude';
  final elevation = 'elevation';
  final siteSeries = 'siteSeries';
  final smr = 'smr';
  final snr = 'snr';
  final soilSiteFactors = 'soilSiteFactors';
  final sitePrep = 'sitePrep';
  final species = 'species';
  final seedlot = 'seedlot';
  final treesNumber = 'treesNumber';
  final spacing = 'spacing';
  final plantingNotes = 'plantingNotes';
}
