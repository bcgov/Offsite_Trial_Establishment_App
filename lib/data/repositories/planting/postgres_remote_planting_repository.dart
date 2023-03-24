import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/constants/database/database.dart';
import 'package:offsite_trial_establishment_app/common/extensions/string_ext.dart';
import 'package:offsite_trial_establishment_app/common/utils/postgres_manager.dart';
import 'package:offsite_trial_establishment_app/data/extensions/enum_codes_ext.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/planting.dart';
import 'package:offsite_trial_establishment_app/domain/repositories/planting/remote_planting_repository.dart';
import 'package:offsite_trial_establishment_app/domain/services/image_service.dart';

@LazySingleton(as: RemotePlantingRepository)
class PostgresRemotePlantingRepository extends RemotePlantingRepository {
  final PostgresManager _connection;
  final ImageService _imageService;

  PostgresRemotePlantingRepository(
    this._connection,
    this._imageService,
  );

  @override
  Future<Planting?> save(Planting planting, Future<Planting?> Function() onSave) async {
    return await _connection.transaction((connection) async {
      await connection.query(
        planting.syncStatus.isFirstSync ? Database.planting.insertQuery : Database.planting.updateQuery,
        substitutionValues: _getValues(planting),
      );
      final directory = (await _imageService.getDirectory()).path;
      for (final image in planting.photoPaths) {
        final file = File('$directory/$image');
        if (!await file.exists()) continue;
        await connection.query(Database.picture.insertQuery, substitutionValues: {
          Database.picture.values.plantingId: planting.plantingId,
          Database.picture.values.picture: base64Encode(await file.readAsBytes()),
        });
      }
      return await onSave();
    });
  }

  @override
  Future<bool> canSaveWithId(String id) async {
    final result = await _connection.mappedResultsQuery(
      Database.planting.queryById,
      substitutionValues: {
        Database.planting.values.id: id,
      },
    );
    return result.isEmpty;
  }

  Map<String, dynamic> _getValues(Planting planting) => {
        Database.planting.values.id: planting.plantingId,
        Database.planting.values.trialId: planting.trial?.id,
        Database.planting.values.planterId: planting.planter?.id,
        Database.planting.values.trialContactId: planting.trial?.contact?.id,
        Database.planting.values.blockId: planting.blockId.takeIfNotBlank,
        Database.planting.values.date: planting.date,
        Database.planting.values.latitude: planting.location?.latitude,
        Database.planting.values.longitude: planting.location?.longitude,
        Database.planting.values.elevation: planting.location?.elevation,
        Database.planting.values.siteSeries: planting.site?.series,
        Database.planting.values.smr: planting.site?.smr?.code,
        Database.planting.values.snr: planting.site?.snr?.code,
        Database.planting.values.soilSiteFactors: planting.site?.soil?.code,
        Database.planting.values.sitePrep: planting.site?.preparation?.code,
        Database.planting.values.species: planting.seedlings?.species?.code,
        Database.planting.values.seedlot: planting.seedlings?.seedlot,
        Database.planting.values.treesNumber: planting.seedlings?.count,
        Database.planting.values.spacing: planting.seedlings?.spacing,
        Database.planting.values.plantingNotes: planting.seedlings?.notes.takeIfNotBlank,
      };
}
