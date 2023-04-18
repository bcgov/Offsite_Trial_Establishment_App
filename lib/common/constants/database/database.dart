import 'package:offsite_trial_establishment_app/common/constants/database/picture_table.dart';
import 'package:offsite_trial_establishment_app/common/constants/database/planter_table.dart';
import 'package:offsite_trial_establishment_app/common/constants/database/planting_table.dart';
import 'package:offsite_trial_establishment_app/common/constants/database/trial_table.dart';

abstract class Database {
  static final planter = PlanterTable();
  static final trial = TrialTable();
  static final planting = PlantingTable();
  static final picture = PictureTable();

  static const host = "159.203.56.62";
  static const port = 5432;
  static const database = "reforest_app";
  static const username = "postgres";
  static const password = "BECisGOD2023";
}
