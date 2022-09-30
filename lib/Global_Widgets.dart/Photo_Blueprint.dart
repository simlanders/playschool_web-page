import 'package:cloud_firestore/cloud_firestore.dart';

class Photo_Blueprint {
  //The name the user displays to other users
  final String name;

  //The actual post message
  final String email;
  // This is the  ID given to each post
  final String position;
  final String photo_url;

  final String start_age;

  final String end_age;

  final String order_number;

  final String staff_ID;

//constructor
  Photo_Blueprint({
    required this.name,
    required this.email,
    required this.position,
    required this.photo_url,
    required this.start_age,
    required this.end_age,
    required this.order_number,
    required this.staff_ID,
  });

  factory Photo_Blueprint.fromMap(String id, Map<String, dynamic> data) {
    return Photo_Blueprint(
      staff_ID: id,
      name: data['name'],
      email: data['email'],
      position: data['position'],
      photo_url: data['photo_url'],
      end_age: data['end_age'],
      start_age: data['start_age'],
      order_number: data['order_number'],
    );
  }

  
}
