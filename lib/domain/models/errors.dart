import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/common/extensions/string_ext.dart';
import 'package:offsite_trial_establishment_app/domain/models/permissions.dart';

class PermissionException extends Error {
  final Permission permission;

  PermissionException(
    this.permission,
  );

  @override
  String toString() {
    return '${permission.name.firstUpperFormat} access denied';
  }
}

class ValidationException extends Error {
  final Map<String, String> errors;

  ValidationException({
    required this.errors,
  });
}

class ConnectionException extends Error {
  @override
  String toString() {
    return Strings.error.noConnection();
  }
}

class OpenDatabaseException extends Error {}
