import 'package:auto_route/auto_route.dart';
import 'package:offsite_trial_establishment_app/common/constants/routes.dart';
import 'package:offsite_trial_establishment_app/common/routes/app_router.dart';

extension DialogClose on AppRouter {
  /// Pushing route and close dialog if it's open
  Future<T?> dismissAndPush<T extends Object?>(
    PageRouteInfo route, {
    OnNavigationFailure? onFailure,
  }) {
    dismissActiveDialogs();
    return push(route, onFailure: onFailure);
  }

  void dismissAndPopForced<T extends Object?>({
    T? result,
  }) {
    dismissActiveDialogs();
    return popForced(result);
  }

  void dismissActiveDialogs() {
    popUntil((route) => route.settings.name?.contains(RouteName.routeSuffix) == true);
  }
}
