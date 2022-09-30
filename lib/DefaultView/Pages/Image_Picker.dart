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
import 'package:playschool/DefaultView/Pages/Add_Home_Pics_Page.dart';
import 'package:playschool/DefaultView/Pages/D_Home.dart';

import 'Add_Staff_Page.dart';

class Image_Picker extends StatefulWidget {
  @override
  State<Image_Picker> createState() => _Image_PickerState();

  final String folder;

  final String? name;

  final String? start_age_group;

  final String? end_age_group;

  final String? position;

  final String? email;

  String? url = '';

  Image_Picker(
      {required this.folder,
      required this.start_age_group,
      required this.end_age_group,
      required this.position,
      required this.name,
      required this.email});
}

class _Image_PickerState extends State<Image_Picker> {
  //final String home_Folder = "homePics/";

  final storageRef = FirebaseStorage.instance.ref();

  @override
  Widget build(BuildContext context) {
    _pickFile();

    return TextButton(
      onPressed: () {},
      child: Text(''),
    );
  }

  _pickFile() async {
    final ImagePicker _picker = ImagePicker();

    List<XFile>? image = await _picker.pickMultiImage();

    if (image == null) {
      leave();
    }

    image!.forEach((element) async {
      final imagesRef = storageRef.child(widget.folder + element.name);
      imagesRef.putData(await element.readAsBytes()).whenComplete(() async {
        widget.url = await imagesRef.getDownloadURL().whenComplete(() async {
          leave();
        });
        
      });
    });
  }

  leave() {
    if (widget.folder == 'homePics/') {
      return Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Add_Home_Pics_Page()));
    } else if (widget.folder == 'staffPics/') {
      
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Add_Staff_Page(
                    email: widget.email,
                    name: widget.name,
                    position: widget.position,
                    url: widget.url,
                    end_age_group: widget.end_age_group,
                    start_age_group: widget.start_age_group,
                  )));
    } else {
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => D_Home()));
    }
  }
}
