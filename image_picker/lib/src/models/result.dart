import 'dart:typed_data';

import 'package:image_picker/src/models/permission_type.dart';

class ImagePickerResult {
  final List<Uint8List> images;
  final PermissionType permissionType;

  ImagePickerResult(
    this.images,
    this.permissionType,
  );
}
