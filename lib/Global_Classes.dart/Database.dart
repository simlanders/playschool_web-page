import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'dart:async';

import '../Global_Widgets.dart/Photo_Blueprint.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final StreamController<List<Photo_Blueprint>> _staff_Photo_Controller =
      StreamController<List<Photo_Blueprint>>();
  final List url = [];

  DatabaseService() {
    _firestore.collection('staff').snapshots().listen(_staff_Photo_Updated);
  }

  Stream<List<Photo_Blueprint>> get staff_photos =>
      _staff_Photo_Controller.stream;

  void _staff_Photo_Updated(QuerySnapshot<Map<String, dynamic>> snapshot) {
    List<Photo_Blueprint> photos = _getstaffPhotosFromSnapshot(snapshot);
    _staff_Photo_Controller.add(photos);
  }

  List<Photo_Blueprint> _getstaffPhotosFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    List<Photo_Blueprint> photos = [];
    for (var element in snapshot.docs) {
      Photo_Blueprint photo =
          Photo_Blueprint.fromMap(element.id, element.data());

      photos.add(photo);
      
    }
    photos.sort((a, b) => int.parse(a.order_number).compareTo(int.parse(b.order_number)));
    return photos;
  }

  void updateOrder_Number(String uid, String likes) async {
    final data = {"order_number": likes};

    _firestore.collection("staff").doc(uid).set(data, SetOptions(merge: true));
  }

  Future<void> addStaffPhoto(
    final String name,

    //The actual post message
    final String email,
    // This is the  ID given to each post
    final String position,
    final String photo_url,
    final String start_age,
    final String end_age,
    final String order_number,
  ) async {
    try {
      await _firestore.collection('staff').add({
        'name': name,
        'email': email,
        'position': position,
        'photo_url': photo_url,
        'start_age': start_age,
        'end_age': end_age,
        'order_number': order_number
      }).whenComplete(() => print("===============>>" + "Complete"));
    } on Exception catch (e) {
      print(e.toString() + "<================");
    }

    return;
  }
}
