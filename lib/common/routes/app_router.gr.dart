// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: HomePage(key: args.key),
      );
    },
    PlanterSetupRoute.name: (routeData) {
      final args = routeData.argsAs<PlanterSetupRouteArgs>(
          orElse: () => const PlanterSetupRouteArgs());
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: PlanterSetupPage(
          key: args.key,
          isCreating: args.isCreating,
        ),
      );
    },
    CreateTrialRoute.name: (routeData) {
      final args = routeData.argsAs<CreateTrialRouteArgs>(
          orElse: () => const CreateTrialRouteArgs());
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: CreateTrialPage(key: args.key),
      );
    },
    CreatePlantingRoute.name: (routeData) {
      final args = routeData.argsAs<CreatePlantingRouteArgs>(
          orElse: () => const CreatePlantingRouteArgs());
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: CreatePlantingPage(key: args.key),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        RouteConfig(
          PlanterSetupRoute.name,
          path: '/planter-setup-page',
        ),
        RouteConfig(
          CreateTrialRoute.name,
          path: '/create-trial-page',
        ),
        RouteConfig(
          CreatePlantingRoute.name,
          path: '/create-planting-page',
        ),
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({Key? key})
      : super(
          HomeRoute.name,
          path: '/',
          args: HomeRouteArgs(key: key),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [PlanterSetupPage]
class PlanterSetupRoute extends PageRouteInfo<PlanterSetupRouteArgs> {
  PlanterSetupRoute({
    Key? key,
    bool isCreating = false,
  }) : super(
          PlanterSetupRoute.name,
          path: '/planter-setup-page',
          args: PlanterSetupRouteArgs(
            key: key,
            isCreating: isCreating,
          ),
        );

  static const String name = 'PlanterSetupRoute';
}

class PlanterSetupRouteArgs {
  const PlanterSetupRouteArgs({
    this.key,
    this.isCreating = false,
  });

  final Key? key;

  final bool isCreating;

  @override
  String toString() {
    return 'PlanterSetupRouteArgs{key: $key, isCreating: $isCreating}';
  }
}

/// generated route for
/// [CreateTrialPage]
class CreateTrialRoute extends PageRouteInfo<CreateTrialRouteArgs> {
  CreateTrialRoute({Key? key})
      : super(
          CreateTrialRoute.name,
          path: '/create-trial-page',
          args: CreateTrialRouteArgs(key: key),
        );

  static const String name = 'CreateTrialRoute';
}

class CreateTrialRouteArgs {
  const CreateTrialRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CreateTrialRouteArgs{key: $key}';
  }
}

/// generated route for
/// [CreatePlantingPage]
class CreatePlantingRoute extends PageRouteInfo<CreatePlantingRouteArgs> {
  CreatePlantingRoute({Key? key})
      : super(
          CreatePlantingRoute.name,
          path: '/create-planting-page',
          args: CreatePlantingRouteArgs(key: key),
        );

  static const String name = 'CreatePlantingRoute';
}

class CreatePlantingRouteArgs {
  const CreatePlantingRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CreatePlantingRouteArgs{key: $key}';
  }
}
