import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/constants/database/database.dart';
import 'package:offsite_trial_establishment_app/common/extensions/string_ext.dart';
import 'package:offsite_trial_establishment_app/common/utils/postgres_manager.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status.dart';
import 'package:offsite_trial_establishment_app/domain/models/trial.dart';
import 'package:offsite_trial_establishment_app/domain/repositories/trial/remote_trial_repository.dart';

@LazySingleton(as: RemoteTrialRepository)
class PostgresRemoteTrialRepository extends RemoteTrialRepository {
  final PostgresManager _connection;

  PostgresRemoteTrialRepository(
    this._connection,
  );

  @override
  Future<Trial?> save(Trial trial, Future<Trial?> Function() onSave) async {
    return await _connection.transaction((connection) async {
      await connection.query(
        trial.syncStatus.isFirstSync ? Database.trial.insertQuery : Database.trial.updateQuery,
        substitutionValues: _getValues(trial),
      );
      return await onSave();
    });
  }

  @override
  Future<bool> canSaveWithId(String id) async {
    final result = await _connection.mappedResultsQuery(
      Database.trial.queryById,
      substitutionValues: {
        Database.trial.values.id: id,
      },
    );
    return result.isEmpty;
  }

  Map<String, dynamic> _getValues(Trial trial) => {
        Database.trial.values.id: trial.id,
        Database.trial.values.nickname: trial.nickname,
        Database.trial.values.contactId: trial.contact?.id,
        Database.trial.values.lastName: trial.contact?.lastName.takeIfNotBlank,
        Database.trial.values.firstName: trial.contact?.firstName.takeIfNotBlank,
        Database.trial.values.email: trial.contact?.email.takeIfNotBlank,
        Database.trial.values.phone: trial.contact?.phone.takeTrimIfMinLength(2),
        Database.trial.values.company: trial.contact?.organization.trim(),
        Database.trial.values.objective: trial.objective.trim(),
      };
}
