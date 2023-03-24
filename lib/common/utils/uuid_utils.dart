import 'package:uuid/uuid.dart';

abstract class UuidUtils {
  static const uuidGenerator = Uuid();

  static String generate() => uuidGenerator.v4();
}
