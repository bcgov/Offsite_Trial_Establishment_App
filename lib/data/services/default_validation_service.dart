import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/constants/regex.dart';
import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/common/constants/validation_keys.dart';
import 'package:offsite_trial_establishment_app/common/extensions/string_ext.dart';
import 'package:offsite_trial_establishment_app/domain/models/errors.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/planting.dart';
import 'package:offsite_trial_establishment_app/domain/models/planter.dart';
import 'package:offsite_trial_establishment_app/domain/models/trial.dart';
import 'package:offsite_trial_establishment_app/domain/services/validation_service.dart';

@LazySingleton(as: ValidationService)
class DefaultValidationService extends ValidationService {
  @override
  Future<void> validationPlanter(Planter planter) async {
    final errors = <String, String>{};
    if (planter.nickname.isBlank) {
      errors[ValidationKeys.planter.nickname] = Strings.error.isEmpty();
    }
    if (planter.organization.isBlank) {
      errors[ValidationKeys.planter.organization] = Strings.error.isEmpty();
    }
    if (planter.email.isNotBlank) {
      if (!_emailValidation(planter.email)) {
        errors[ValidationKeys.planter.email] = Strings.error.incorrectEmail();
      }
    }
    if (planter.phone.trim().length > 1) {
      if (!_phoneValidation(planter.phone)) {
        errors[ValidationKeys.planter.phone] = Strings.error.incorrectPhone();
      }
    }
    if (errors.isEmpty) return;
    throw ValidationException(
      errors: errors,
    );
  }

  @override
  Future<void> validationTrial(Trial trial) async {
    final errors = <String, String>{};
    if (trial.objective.isBlank) {
      errors[ValidationKeys.trial.objective] = Strings.error.isEmpty();
    }
    if (trial.nickname.isBlank) {
      errors[ValidationKeys.trial.nickname] = Strings.error.isEmpty();
    }
    if (trial.contact?.id.isBlank != false) {
      errors[ValidationKeys.trial.contactId] = Strings.error.isEmpty();
    }
    if (trial.contact?.organization.isBlank != false) {
      errors[ValidationKeys.trial.organization] = Strings.error.isEmpty();
    }
    if (trial.contact?.email.isNotBlank == true) {
      if (!_emailValidation(trial.contact?.email ?? '')) {
        errors[ValidationKeys.trial.email] = Strings.error.incorrectEmail();
      }
    }
    if ((trial.contact?.phone.trim().length ?? 0) > 1) {
      if (!_phoneValidation(trial.contact?.phone ?? '')) {
        errors[ValidationKeys.trial.phone] = Strings.error.incorrectPhone();
      }
    }
    if (errors.isEmpty) return;
    throw ValidationException(
      errors: errors,
    );
  }

  @override
  Future<void> validationPlanting(Planting planting) async {
    final errors = <String, String>{};

    if (planting.trial?.nickname.isBlank != false) {
      errors[ValidationKeys.planting.trialNickname] = Strings.error.isEmpty();
    }
    if (planting.trial?.contact?.id.isBlank != false) {
      errors[ValidationKeys.planting.contactId] = Strings.error.isEmpty();
    }
    if (planting.plantingId.isBlank) {
      errors[ValidationKeys.planting.plantingId] = Strings.error.isEmpty();
    }
    if (planting.date == null) {
      errors[ValidationKeys.planting.date] = Strings.error.isNull();
    }
    if (planting.location?.latitude == null) {
      errors[ValidationKeys.planting.latitude] = Strings.error.isNull();
    } else if (!_latitudeValidation(planting.location?.latitude)) {
      errors[ValidationKeys.planting.latitude] = Strings.error.incorrectLatitude();
    }
    if (planting.location?.longitude == null) {
      errors[ValidationKeys.planting.longitude] = Strings.error.isNull();
    } else if (!_longitudeValidation(planting.location?.longitude)) {
      errors[ValidationKeys.planting.longitude] = Strings.error.incorrectLongitude();
    }
    if (planting.location?.elevation == null) {
      errors[ValidationKeys.planting.elevation] = Strings.error.isNull();
    }
    if (planting.photoPaths.isEmpty) {
      errors[ValidationKeys.planting.photo] = Strings.error.photoEmpty();
    }

    if ((planting.seedlings?.count ?? -1) < 0) {
      errors[ValidationKeys.planting.seedlings.count] = Strings.error.isNull();
    }
    if (planting.seedlings?.species == null) {
      errors[ValidationKeys.planting.seedlings.species] = Strings.error.isNull();
    }
    if (planting.seedlings?.seedlot.isBlank != false) {
      errors[ValidationKeys.planting.seedlings.seedlot] = Strings.error.isEmpty();
    }
    if ((planting.seedlings?.spacing ?? -1) < 0) {
      errors[ValidationKeys.planting.seedlings.spacing] = Strings.error.isEmpty();
    }
    if (errors.isEmpty) return;
    throw ValidationException(
      errors: errors,
    );
  }

  bool _emailValidation(String email) {
    return AppRegex.email.hasMatch(email);
  }

  bool _phoneValidation(String email) {
    return AppRegex.digitsPhone.hasMatch(email);
  }

  bool _latitudeValidation(double? latitude) {
    if (latitude == null) return false;
    if (!latitude.isFinite) return false;
    return latitude.abs() <= 90;
  }

  bool _longitudeValidation(double? longitude) {
    if (longitude == null) return false;
    if (!longitude.isFinite) return false;
    return longitude.abs() <= 180;
  }
}
