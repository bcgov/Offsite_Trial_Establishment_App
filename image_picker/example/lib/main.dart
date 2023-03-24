import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Uint8List> _images = [];
  final _imagePickerPlugin = ImagePicker();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    final ImagePickerResult result = await _imagePickerPlugin.pickImage(smallSideCompress: 1080);
    _images = result.images;
    final files = await Future.wait(result.images.mapIndexed((index, bytes) async {
      final directory = await getApplicationDocumentsDirectory();
      final photoDirectory = Directory('${directory.path}/photos');
      if (!await photoDirectory.exists()) await photoDirectory.create();
      final filePath = '${photoDirectory.path}/photo_${DateTime.now().millisecondsSinceEpoch}_$index';
      final file = File(filePath);
      await file.writeAsBytes(bytes);
      return filePath;
    }));
    Share.shareFiles(files);
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => Image.memory(_images[index]),
          itemCount: _images.length,
        ),
      ),
    );
  }
}
