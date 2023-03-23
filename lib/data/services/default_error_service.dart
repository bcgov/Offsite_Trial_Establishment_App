import 'package:app_settings/app_settings.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:objectbox/objectbox.dart';
import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/common/extensions/iterable_ext.dart';
import 'package:offsite_trial_establishment_app/common/extensions/router_ext.dart';
import 'package:offsite_trial_establishment_app/common/routes/app_router.dart';
import 'package:offsite_trial_establishment_app/common/utils/error_utils.dart';
import 'package:offsite_trial_establishment_app/di/di.dart';
import 'package:offsite_trial_establishment_app/domain/models/errors.dart';
import 'package:offsite_trial_establishment_app/domain/models/permissions.dart';
import 'package:offsite_trial_establishment_app/domain/services/error_service.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/dialog/dialog_manager.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/dialog/dialog_widget.dart';
import 'package:offsite_trial_establishment_app/ui/widgets/error/error_handler.dart';

@LazySingleton(as: ErrorService)
class DefaultErrorService extends ErrorService {
  late final _logger = getIt<Logger>();
  final AppRouter _router;
  DialogCompleter? _dialogCompleter;

  DefaultErrorService(
    this._router,
  );

  @override
  Future<void> catchError(
    error,
    StackTrace? stackTrace, {
    required bool showDialog,
  }) async {
    if (error is ValidationException) return _showValidationErrors(error);
    if (error is PermissionException) return _showPermissionDialog(error.permission);
    final message = ErrorUtils.getErrorMessage(error);
    _logger.e(message, error, stackTrace);
    if (error is PlatformException) return;
    if (error is MissingPluginException) return;
    if (error is ObjectBoxException) return;
    await _showDialog(message ?? Strings.error.defaultMessage());
  }

  Future<void> _showDialog(String message) async {
    final context = _router.navigatorKey.currentContext;
    if (context == null) return;
    _closeDialog();
    await _dialogCompleter?.future;
    _dialogCompleter = DialogManager.createErrorDialog(
      context: context,
      error: message,
      onClose: _closeDialog,
    );
  }

  Future<void> _showPermissionDialog(Permission permission) async {
    final context = _router.navigatorKey.currentContext;
    if (context == null) return;
    _closeDialog();
    await _dialogCompleter?.future;
    _dialogCompleter = DialogManager.createPermissionDialog(
      context: context,
      permission: permission,
      onClose: _closeDialog,
      onSettings: () {
        AppSettings.openAppSettings();
        _closeDialog();
      },
    );
  }

  void _closeDialog() {
    _router.dismissActiveDialogs();
  }

  Future<void> _showValidationErrors(ValidationException error) async {
    final context = _router.navigatorKey.currentContext;
    if (context == null) return;
    _closeDialog();
    final errorHandler = ErrorHandler.of(context);
    await _dialogCompleter?.future;
    final unhandledErrors = errorHandler?.handle(error.errors) ?? error.errors;
    if (unhandledErrors.isEmpty) return;
    _dialogCompleter = DialogManager.createErrorDialog(
      context: context,
      error: unhandledErrors.entries.mapList((e) => "${e.key}: ${e.value}").join("\n"),
      onClose: _closeDialog,
    );
  }
}
