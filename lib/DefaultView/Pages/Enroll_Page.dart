

import 'package:flutter/material.dart';

import '../Widgets/TabWidget.dart';

class Enroll_Page extends StatelessWidget {
  const Enroll_Page({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;

    return Container(
        width: Width,
        height: Height,
        child: Column(
          children: [
            
            TabWidget(),

            Container(
                width: Width,
                height: Height - 85,
                color: Colors.yellow,
                child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Text('Enroll Page in Progress',
                      style: TextStyle(
                        fontSize: 35, 
                        color:Colors.tealAccent,
                        decoration: TextDecoration.none)),

                    ]))
          ],
        ));
  }
}