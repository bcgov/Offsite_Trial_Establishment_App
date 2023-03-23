import 'package:flutter_background_executor/flutter_background_executor.dart';
import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/constants/enviroment.dart';
import 'package:offsite_trial_establishment_app/common/constants/instance_name.dart';

@module
abstract class BackgroundModule {
  @LazySingleton(env: AppEnvironment.foreground)
  @Named(InstanceNames.isForeground)
  bool get foreground => true;

  @LazySingleton(env: AppEnvironment.background)
  @Named(InstanceNames.isForeground)
  bool get background => false;

  @LazySingleton(env: AppEnvironment.foreground)
  @Named(InstanceNames.isRefresh)
  bool get foregroundIsRefresh => false;

  @LazySingleton(env: AppEnvironment.sync)
  @Named(InstanceNames.isRefresh)
  bool get syncIsRefresh => false;

  @LazySingleton(env: AppEnvironment.refresh)
  @Named(InstanceNames.isRefresh)
  bool get refreshIsRefresh => true;

  @LazySingleton(env: AppEnvironment.foreground)
  @Named(InstanceNames.taskIdentifier)
  String get foregroundTaskIdentifier => Tasks.mainApplication;

  @LazySingleton(env: AppEnvironment.background)
  @Named(InstanceNames.taskIdentifier)
  String get backgroundTaskIdentifier => Tasks.defaultBackground;
}
