import 'dart:io';

abstract class ImageService {
  Future<Directory> getDirectory();

  Future<List<String>> pickImage();

  Future<void> deleteImage(String path);
}
