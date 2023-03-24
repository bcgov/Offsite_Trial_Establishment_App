import 'package:flutter/services.dart';
import 'package:image_picker/src/constants/definitions.dart';
import 'package:image_picker/src/mapper/permission_type_mapper.dart';
import 'package:image_picker/src/models/permission_type.dart';
import 'package:image_picker/src/models/result.dart';

class ImagePicker {
  final methodChannel = const MethodChannel(Definitions.methodChannel);

  Future<ImagePickerResult> pickImage({int? smallSideCompress}) async {
    final result = await methodChannel.invokeMapMethod<String, dynamic>(
      Definitions.pickImageMethod,
      {
        Definitions.smallSideCompressParam: smallSideCompress,
      },
    );

    return ImagePickerResult(
      (result?[Definitions.imagesParam] as List?)?.map((e) => e as Uint8List?).whereType<Uint8List>().toList() ?? [],
      PermissionTypeMapper.create(from: result?[Definitions.permissionParam]) ?? PermissionType.denied,
    );
  }
}
