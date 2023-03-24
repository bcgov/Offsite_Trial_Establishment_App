import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/domain/models/errors.dart';

abstract class ErrorUtils {
  static String? getErrorMessageFromList(List errors) {
    final strings = errors.map((e) => getErrorMessage(e)).whereType<String>().toSet();
    return strings.isNotEmpty ? strings.join('\n') : Strings.error.defaultMessage();
  }

  static String? getErrorMessage(error) {
    if (error is PermissionException) {
      return error.toString();
    }
    if (error is ConnectionException) {
      return error.toString();
    }
    return null;
  }
}
