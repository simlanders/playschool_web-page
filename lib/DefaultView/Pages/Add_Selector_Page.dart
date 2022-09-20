import 'package:flutter/material.dart';
import 'package:playschool/DefaultView/Pages/Add_Home_Pics_Page.dart';
import 'package:playschool/DefaultView/Pages/Add_Staff_Page.dart';

import '../Widgets/TabWidget.dart';

class Add_Selector_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Click A Button Below To Add", style: TextStyle(fontSize: 25, color: Colors.blueAccent),),
            //Sends you to the SignInSelector() page to sign in with email or facebook
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Add_Staff_Page(email: '', name: '', position: '', url: '', end_age_group: '', start_age_group: '',)));
                },
                child: Text("STAFF", style: TextStyle(fontSize: 25, color: Colors.amber),),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: Colors.red)),
                  ),
                )),
            //Adds space between the boxes
            SizedBox(
              height: 25,
            ),
            //Sends you to the SignUpSelector() page to sign up with email or facebook
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Add_Home_Pics_Page()));
                },
                child: Text("HOME PICS", style: TextStyle(fontSize: 25, color: Colors.amber),),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red))))),
          ],
        ),
      ),
    );
  }


}
