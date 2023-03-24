class TrialTable {
  final table = 'trial_info';
  final column = TrialColumn();
  final values = TrialValues();

  late final queryById = '''
SELECT ${column.id} FROM $table WHERE ${column.id} = @${values.id};
''';

  late final insertQuery = '''
INSERT INTO $table (${column.id}, ${column.nickname}, ${column.contactId}, ${column.company}, ${column.objective}, ${column.lastName}, ${column.firstName}, ${column.email}, ${column.phone}) 
VALUES (@${values.id}, @${values.nickname}, @${values.contactId}, @${values.company}, @${values.objective}, @${values.lastName}, @${values.firstName}, @${values.email}, @${values.phone});
''';

  late final updateQuery = '''
  UPDATE $table SET 
  ${column.nickname} = @${values.nickname},
  ${column.contactId} = @${values.contactId},
  ${column.company} = @${values.company},
  ${column.objective} = @${values.objective},
  ${column.lastName} = @${values.lastName},
  ${column.firstName} = @${values.firstName},
  ${column.email} = @${values.email},
  ${column.phone} = @${values.phone}
  WHERE ${column.id} = @${values.id};
''';
}

class TrialColumn {
  final id = '_id';
  final nickname = 'trial_id';
  final contactId = 'trial_contact_id';
  final company = 'trial_company_organization';
  final objective = 'trial_objective';
  final lastName = 'trial_contact_last_name';
  final firstName = 'trial_contact_first_name';
  final email = 'trial_contact_email';
  final phone = 'trial_contact_phone';
}

class TrialValues {
  final id = 'id';
  final nickname = 'nickname';
  final contactId = 'contactId';
  final company = 'companyOrganization';
  final objective = 'objective';
  final lastName = 'contactLastName';
  final firstName = 'contactFirstName';
  final email = 'contactEmail';
  final phone = 'contactPhone';
}
