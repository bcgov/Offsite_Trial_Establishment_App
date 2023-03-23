class PictureTable {
  final table = 'planting_picture';
  final column = PictureColumn();
  final values = PictureValues();

// Postgres library can't send byte array correctly.
// But if send image in base64 and use decode function in sql query, we can store images correctly along with exif.
  late final insertQuery = '''
INSERT INTO $table (${column.plantingId}, ${column.picture}) 
VALUES (@${values.plantingId}, decode(@${values.picture}, 'base64'));
''';
}

class PictureColumn {
  final plantingId = 'plantation_id';
  final picture = 'picture';
}

class PictureValues {
  final plantingId = 'plantingId';
  final picture = 'picture';
}
