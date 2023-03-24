import 'dart:io';

import 'package:path_provider/path_provider.dart';

abstract class ObjectBoxFiles {
  static Future<String> get main async => _getPath('objectbox');

  static Future<String> get background async => _getPath('objectbox-background');

  static Future<String> _getPath(String suffix) async {
    final dir = Directory('${(await getApplicationDocumentsDirectory()).path}/$suffix');
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir.path;
  }
}
