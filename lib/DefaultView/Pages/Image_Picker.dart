import 'dart:html' as html;
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker_web/image_picker_web.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:playschool/DefaultView/Pages/D_Home.dart';

class Image_Picker extends StatefulWidget {
  @override
  State<Image_Picker> createState() => _Image_PickerState();
}

class _Image_PickerState extends State<Image_Picker> {
  final String home_Folder = "homePics/";

  final storageRef = FirebaseStorage.instance.ref();

  @override
  Widget build(BuildContext context) {
    _pickFile(home_Folder);

    return TextButton(
      onPressed: () {
        _pickFile(home_Folder);
      },
      child: Text(''),
    );
  }

  Future<Future<Object?>> _pickFile(String folder) async {
    final ImagePicker _picker = ImagePicker();

    List<XFile>? image = await _picker.pickMultiImage();

    if (image == null) {
      return Navigator.push(
          context, MaterialPageRoute(builder: (context) => Image_Picker()));
    }

    image.forEach((element) async {
      final imagesRef = storageRef.child(folder + element.name);
      imagesRef.putData(await element.readAsBytes()).whenComplete(() async {
        print(await imagesRef.getDownloadURL());
      });
    });

    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => Image_Picker()));
  }
}
