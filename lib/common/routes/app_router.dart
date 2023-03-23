import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/constants/routes.dart';
import 'package:offsite_trial_establishment_app/ui/features/home/home_page.dart';
import 'package:offsite_trial_establishment_app/ui/features/planter/setup/planter_setup_page.dart';
import 'package:offsite_trial_establishment_app/ui/features/planting/create/create_planting_page.dart';
import 'package:offsite_trial_establishment_app/ui/features/trial/create/create_trial_page.dart';

part 'app_router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: RouteName.replaceInRouteName,
  routes: [
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: PlanterSetupPage),
    AutoRoute(page: CreateTrialPage),
    AutoRoute(page: CreatePlantingPage),
  ],
)
@singleton
class AppRouter extends _$AppRouter {}
