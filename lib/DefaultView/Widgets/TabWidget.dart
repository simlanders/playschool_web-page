import 'package:flutter/material.dart';
import 'package:playschool/DefaultView/Pages/D_Contact_Page.dart';
import 'package:playschool/DefaultView/Pages/Enroll_page.dart';
import 'package:playschool/DefaultView/Pages/Staff_Page.dart';

import '../Pages/D_Home.dart';
import '../Pages/Image_Picker.dart';

class TabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;

    return Container(
      width: Width,
      height: 85,
      color: Colors.green,
      child: Column(children: [
        const Text(
          'PLAYSKOOL FAITH LEARNING ACADEMY',
          style: TextStyle(
              color: Colors.amber,
              fontSize: 25,
              decoration: TextDecoration.none),
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => D_Home()));
              },
              child: new Text("HOME",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      decoration: TextDecoration.none)),
            ),
            SizedBox(
              width: (Width / 8),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => D_Contact_Page()));
              },
              child: new Text("CONTACT US",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      decoration: TextDecoration.none)),
            ),
            SizedBox(
              width: (Width / 8),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Enroll_Page()));
              },
              child: new Text("ENROLL",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      decoration: TextDecoration.none)),
            ),
            SizedBox(
              width: (Width / 8),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Staff_Page()));
              },
              child: new Text("STAFF",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      decoration: TextDecoration.none)),
            ),
            
            SizedBox(
              width: (Width / 8),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Staff_Page()));
              },
              child: new Text("Admin-Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      decoration: TextDecoration.none),textAlign: TextAlign.right,),
            ),
                  
          ],
        )
      ]),
    );
  }
}
