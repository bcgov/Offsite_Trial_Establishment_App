import 'package:offsite_trial_establishment_app/common/constants/database/picture_table.dart';
import 'package:offsite_trial_establishment_app/common/constants/database/planter_table.dart';
import 'package:offsite_trial_establishment_app/common/constants/database/planting_table.dart';
import 'package:offsite_trial_establishment_app/common/constants/database/trial_table.dart';

abstract class Database {
  static final planter = PlanterTable();
  static final trial = TrialTable();
  static final planting = PlantingTable();
  static final picture = PictureTable();

  static const host = "";   // your db host, e.g. example.com
  static const port = 5432;   // your db port (5432 is default for PostgreSQL)
  static const database = ""; // database name, e.g. reforestation
  static const username = ""; // database user with access to the database above
  static const password = ""; // user's password
}
