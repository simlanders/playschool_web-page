import 'package:flutter/material.dart';

class StaffContainerWidget extends StatelessWidget {
  ///testing 123
  String? image;

  final String name;

  final String email;

  final String gradeLevel;

  final String position;

  StaffContainerWidget({
    required this.image,
    required this.name,
    required this.gradeLevel,
    required this.email,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;

    final double h = MediaQuery.of(context).size.height;

    if (image == null) {
      image = 'gs://playschool-fae76.appspot.com/staffPics/photo-coming-soon-002.jpg';
    }

    return Container(
      width: (w / 3),
      height: (h - 128),
      color: Colors.blue,
      child: Column(children: [
        //Picture
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: (((h - 128) / 1.5))),
            Image.network(
          image!,
          width: (w/3)-7,height:(((h - 128) / 1.5))/2 ,),
            
          ],
        ),
        //Name
        Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
        //AgeGroup
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Age Group:',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            Text(
              gradeLevel,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
        //Position
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Postion: ',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            Text(
              position,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
        //Email
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email: ',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            Text(
              email,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      ]),
    );
  }
}
