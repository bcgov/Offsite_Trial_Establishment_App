import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/constants/enviroment.dart';
import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/common/constants/theme.dart';
import 'package:offsite_trial_establishment_app/common/routes/app_router.dart';
import 'package:offsite_trial_establishment_app/common/utils/background_task_manager.dart';
import 'package:offsite_trial_establishment_app/di/di.dart';
import 'package:offsite_trial_establishment_app/domain/interactors/planter_interactor.dart';
import 'package:offsite_trial_establishment_app/domain/services/error_service.dart';
import 'package:offsite_trial_establishment_app/domain/services/foreground_sync_service.dart';
import 'package:offsite_trial_establishment_app/domain/services/lifecycle_service.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/error/error_handler.dart' as error;

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await BackgroundTaskManager.stopAllTasks();
      await getItInit(
        env: const String.fromEnvironment(
          AppEnvironment.key,
          defaultValue: Environment.dev,
        ),
      );
      getIt<LifecycleService>().addListener(handleResumedState);
      await BackgroundTaskManager.initRefreshTasks();
      final planter = await getIt<PlanterInteractor>().getActivePlanter().first;
      runApp(MyApp(openPlanter: planter == null));
    },
    (error, stack) => getIt<ErrorService>().catchError(error, stack, showDialog: true),
  );
}

var currentState = AppLifecycleState.resumed;

Future<void> handleResumedState(AppLifecycleState state) async {
  currentState = state;
  final syncService = getIt<ForegroundSyncService>();
  if (state == AppLifecycleState.resumed) {
    await BackgroundTaskManager.stopRefreshTask();
    // Restart sync if needed
    await syncService.reload();
  } else if (state == AppLifecycleState.paused) {
    await BackgroundTaskManager.stopAllTasks();
    await syncService.cancel();
  }
}

class MyApp extends StatelessWidget {
  final router = getIt<AppRouter>();
  final bool openPlanter;

  MyApp({super.key, required this.openPlanter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      builder: (ctx, child) {
        return error.ErrorWidget(
          child: MaterialApp.router(
            routerDelegate: router.delegate(initialRoutes: openPlanter ? [PlanterSetupRoute(isCreating: true)] : null),
            routeInformationParser: router.defaultRouteParser(),
            title: Strings.app.name(),
            theme: AppTheme.light,
            themeMode: ThemeMode.light,
          ),
        );
      },
    );
  }
}
