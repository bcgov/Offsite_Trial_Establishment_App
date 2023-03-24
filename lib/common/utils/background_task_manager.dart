import 'dart:io';
import 'dart:ui';

import 'package:flutter_background_executor/flutter_background_executor.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:offsite_trial_establishment_app/common/constants/enviroment.dart';
import 'package:offsite_trial_establishment_app/common/utils/object_box_manager.dart';
import 'package:offsite_trial_establishment_app/di/di.dart';
import 'package:offsite_trial_establishment_app/domain/services/background_sync_service.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:path_provider_ios/path_provider_ios.dart';

const _task = 'ca.bc.gov.offsite_trial_establishment_app.sync';

const _androidMinUpdateDelay = Duration(hours: 1);
const _androidMaxUpdateDelay = Duration(days: 1);

abstract class BackgroundTaskManager {
  static final _flutterBackgroundExecutor = FlutterBackgroundExecutor();

  static Future<void> initRefreshTasks() async {
    try {
      await _flutterBackgroundExecutor.createRefreshTask(
        callback: startRefresh,
        settings: RefreshTaskSettings(
          androidDetails: AndroidRefreshTaskDetails(
            requiredNetworkType: AndroidNetworkType.connected,
            initialDelay: _androidMinUpdateDelay,
            repeatInterval: _androidMinUpdateDelay,
            flexInterval: _androidMinUpdateDelay,
            minUpdateDelay: _androidMinUpdateDelay,
            maxUpdateDelay: _androidMaxUpdateDelay,
          ),
          iosDetails: IosRefreshTaskDetails(taskIdentifier: _task),
        ),
      );
    } catch (e) {
      getIt<Logger>().e(e);
    }
  }

  static Future<void> initSyncTasks() async {
    try {
      await _flutterBackgroundExecutor.runImmediatelyBackgroundTask(
        callback: startSync,
        cancellable: true,
      );
    } catch (e) {
      getIt<Logger>().e(e);
    }
  }

  static Future<bool> stopRefreshTask() async {
    try {
      return await _flutterBackgroundExecutor.stopRefreshTask();
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<bool> stopAllTasks() async {
    try {
      return await _flutterBackgroundExecutor.stopAllExecutingTasks();
    } catch (e) {
      getIt<Logger>().e(e);
    }
    return false;
  }

  static EngineConnector createConnector(String identifier) {
    return _flutterBackgroundExecutor.createConnector(currentTaskIdentifier: identifier);
  }

  static Future<bool> hasBackgroundTasks() async {
    return _flutterBackgroundExecutor.hasRunningTasks();
  }
}

@pragma('vm:entry-point')
void startRefresh() async {
    await _initDi(
      environmentBuilder: (env) => env.refreshMode(),
      withDi: () async {
        await getIt<BackgroundSyncService>().syncAll();
      },
    );
}

@pragma('vm:entry-point')
void startSync() async {
  await _initDi(
    withDi: () => getIt<BackgroundSyncService>().getCompleter().future,
    environmentBuilder: (env) => env.syncMode(),
  );
}

Future<void> _initDi({
  required Future Function()? withDi,
  required String Function(String) environmentBuilder,
}) async {
  if (Platform.isAndroid) PathProviderAndroid.registerWith();
  if (Platform.isIOS) PathProviderIOS.registerWith();
  DartPluginRegistrant.ensureInitialized();
  await getItInit(
    env: environmentBuilder(const String.fromEnvironment(
      AppEnvironment.key,
      defaultValue: Environment.dev,
    )),
  );
  try {
    await withDi?.call();
  } catch (_) {
  } finally {
    getIt<ObjectBoxManager>().close();
  }
}