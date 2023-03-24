import 'package:image_picker/image_picker.dart';

extension PermissionTypeMapper on PermissionType {
  int get methodChannelValue {
    switch (this) {
      case PermissionType.granted:
        return 1;
      case PermissionType.limited:
        return 2;
      case PermissionType.denied:
        return 3;
      case PermissionType.deniedForever:
        return 4;
    }
  }

  static PermissionType? create({required int? from}) {
    switch (from) {
      case 1:
        return PermissionType.granted;
      case 2:
        return PermissionType.limited;
      case 3:
        return PermissionType.denied;
      case 4:
        return PermissionType.deniedForever;
      default:
        return null;
    }
  }
}
