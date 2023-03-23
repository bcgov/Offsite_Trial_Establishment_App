import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/constants/enviroment.dart';
import 'package:offsite_trial_establishment_app/common/constants/object_box_files.dart';
import 'package:offsite_trial_establishment_app/common/utils/object_box_manager.dart';

@module
abstract class DbModule {
  @preResolve
  @LazySingleton(env: AppEnvironment.foreground)
  Future<ObjectBoxManager> get objectBoxManager async => ObjectBoxManager(directory: await ObjectBoxFiles.main);

  @preResolve
  @LazySingleton(env: AppEnvironment.background)
  Future<ObjectBoxManager> get objectBoxManagerBackground async =>
      ObjectBoxManager(directory: await ObjectBoxFiles.background);
}
