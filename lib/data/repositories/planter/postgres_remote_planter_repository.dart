import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/constants/database/database.dart';
import 'package:offsite_trial_establishment_app/common/extensions/string_ext.dart';
import 'package:offsite_trial_establishment_app/common/utils/postgres_manager.dart';
import 'package:offsite_trial_establishment_app/data/extensions/sync_status.dart';
import 'package:offsite_trial_establishment_app/domain/models/planter.dart';
import 'package:offsite_trial_establishment_app/domain/repositories/planter/remote_planter_repository.dart';

@LazySingleton(as: RemotePlanterRepository)
class PostgresRemotePlanterRepository extends RemotePlanterRepository {
  final PostgresManager _connection;

  PostgresRemotePlanterRepository(
    this._connection,
  );

  @override
  Future<Planter?> save(Planter planter, Future<Planter?> Function() onSave) async {
    return await _connection.transaction((connection) async {
      await connection.query(
        planter.syncStatus.isFirstSync ? Database.planter.insertQuery : Database.planter.updateQuery,
        substitutionValues: _getValues(planter),
      );
      return await onSave();
    });
  }

  @override
  Future<bool> canSaveWithId(String id) async {
    final result = await _connection.mappedResultsQuery(
      Database.planter.queryById,
      substitutionValues: {
        Database.planter.values.id: id,
      },
    );
    return result.isEmpty;
  }

  @override
  Future<String?> getIdByNickname(String nickname) async {
    final result = await _connection.mappedResultsQuery(
      Database.planter.queryIdByNickname,
      substitutionValues: {
        Database.planter.values.nickname: nickname,
      },
    );
    return result.firstOrNull?[Database.planter.table]?[Database.planter.column.id];
  }

  Map<String, dynamic> _getValues(Planter planter) => {
        Database.planter.values.id: planter.id,
        Database.planter.values.nickname: planter.nickname,
        Database.planter.values.lastName: planter.lastName.takeIfNotBlank,
        Database.planter.values.firstName: planter.firstName.takeIfNotBlank,
        Database.planter.values.email: planter.email.takeIfNotBlank,
        Database.planter.values.phone: planter.phone.takeTrimIfMinLength(2),
        Database.planter.values.company: planter.organization,
      };
}
