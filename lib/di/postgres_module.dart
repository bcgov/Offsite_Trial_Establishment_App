import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/constants/database/database.dart';
import 'package:offsite_trial_establishment_app/common/utils/postgres_manager.dart';

@module
abstract class PostgresModule {
  @lazySingleton
  PostgresManager connection() {
    return PostgresManager(
      host: Database.host,
      port: Database.port,
      database: Database.database,
      username: Database.username,
      password: Database.password,
    );
  }
}
