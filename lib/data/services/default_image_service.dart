import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:offsite_trial_establishment_app/common/constants/sizes.dart';
import 'package:offsite_trial_establishment_app/domain/services/image_service.dart';
import 'package:path_provider/path_provider.dart';

@Injectable(as: ImageService)
class DefaultImageService extends ImageService {
  final _picker = ImagePicker();
  final _completer = Completer<Directory>();

  DefaultImageService() {
    _createDirectory();
  }

  Future<void> _createDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    final photoDirectory = Directory('${directory.path}/photos');
    if (!await photoDirectory.exists()) await photoDirectory.create();
    if (!_completer.isCompleted) _completer.complete(photoDirectory);
  }

  @override
  Future<Directory> getDirectory() async {
    return await _completer.future;
  }

  @override
  Future<List<String>> pickImage() async {
    final ImagePickerResult result = await _picker.pickImage(smallSideCompress: Sizes.imageCompress);
    final photoDirectory = await _completer.future;
    return await Future.wait(result.images.mapIndexed((index, bytes) async {
      final fileName = 'photo_${DateTime.now().millisecondsSinceEpoch}_$index';
      final filePath = '${photoDirectory.path}/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(bytes);
      return fileName;
    }));
  }

  @override
  Future<void> deleteImage(String path) async {
    final file = File(path);
    if (await file.exists()) await file.delete();
  }
}
