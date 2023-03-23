class PlanterTable {
  final table = 'planter_info';
  final column = PlanterColumn();
  final values = PlanterValues();

  late final queryById = '''
SELECT ${column.id} FROM $table WHERE ${column.id} = @${values.id};
''';

  late final queryIdByNickname = '''
SELECT ${column.id} FROM $table WHERE ${column.nickname} = @${values.nickname};
''';

  late final insertQuery = '''
INSERT INTO $table (${column.id}, ${column.nickname}, ${column.lastName}, ${column.firstName}, ${column.email}, ${column.phone}, ${column.company}) 
VALUES (@${values.id}, @${values.nickname}, @${values.lastName}, @${values.firstName}, @${values.email}, @${values.phone}, @${values.company});
''';

  late final updateQuery = '''
UPDATE $table SET 
${column.nickname} = @${values.nickname}, 
${column.lastName} = @${values.lastName}, 
${column.firstName} = @${values.firstName}, 
${column.email} = @${values.email}, 
${column.phone} = @${values.phone}, 
${column.company} = @${values.company}
WHERE ${column.id} = @${values.id};
''';
}

class PlanterColumn {
  final id = '_id';
  final nickname = 'planter_id';
  final lastName = 'planter_last_name';
  final firstName = 'planter_first_name';
  final email = 'planter_email';
  final phone = 'planter_phone';
  final company = 'planting_company_organization';
}

class PlanterValues {
  final id = 'id';
  final nickname = 'planterId';
  final lastName = 'planterLastName';
  final firstName = 'planterFirstName';
  final email = 'planterEmail';
  final phone = 'planterPhone';
  final company = 'planterCompanyOrganization';
}
