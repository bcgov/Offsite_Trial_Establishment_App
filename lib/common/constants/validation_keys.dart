abstract class ValidationKeys {
  static final planter = PlanterValidationKeys();
  static final trial = TrialValidationKeys();

  static final planting = PlantingValidationKeys();
}

class PlanterValidationKeys {
  final nickname = 'planter_nickname';
  final organization = 'planter_organization';
  final email = 'planter_email';
  final phone = 'planter_phone';
}

class TrialValidationKeys {
  final nickname = 'trial_nickname';
  final contactId = 'trial_contact_id';
  final organization = 'trial_contact_organization';
  final email = 'trial_contact_email';
  final phone = 'trial_contact_phone';
  final objective = 'trial_objective';
}

class PlantingValidationKeys {
  final seedlings = SeedlingsValidationKeys();
  final trialNickname = 'planting_trial_nickname';
  final contactId = 'planting_contact_id';
  final plantingId = 'planting_planting_id';
  final date = 'planting_date';
  final latitude = 'planting_latitude';
  final longitude = 'planting_longitude';
  final elevation = 'planting_elevation';
  final photo = 'planting_photo';
}

class SeedlingsValidationKeys {
  final count = 'seedlings_planting_count';
  final species = 'seedlings_planting_species';
  final seedlot = 'seedlings_planting_seedlot';
  final spacing = 'seedlings_planting_spacing';
}
