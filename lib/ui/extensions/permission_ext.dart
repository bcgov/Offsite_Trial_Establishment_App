import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/domain/models/permissions.dart';

extension PermissionText on Permission {
  String get textDenied {
    switch (this) {
      case Permission.location:
        return Strings.permission.location();
      case Permission.gallery:
        return Strings.permission.gallery();
    }
  }
}
