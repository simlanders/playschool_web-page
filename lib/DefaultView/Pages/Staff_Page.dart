import 'package:flutter/material.dart';
import 'package:playschool/DefaultView/Widgets/StaffContainerWidget.dart';

import '../Widgets/TabWidget.dart';

class Staff_Page extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        TabWidget(),
        Text(
          'Meet Our Awesome Staff',
          style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
        Container(
          width: Width,
          height: (Height - 114),
          color: Colors.green,
          child: GridView.builder(
            //controller: scrollController,
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return StaffContainerWidget(image:null,
                  name: 'Simeon Landers', gradeLevel: '8-12', email: 'poeeeeeeeetic.sim20@gmail.com', position: 'Director',);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              //childAspectRatio: 0.5,
            ),
          ),
        ),
      ],
    );
  }
}
