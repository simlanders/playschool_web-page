import 'package:flutter/material.dart';
import 'package:playschool/DefaultView/Widgets/StaffContainerWidget.dart';
import 'package:playschool/Global_Classes.dart/Database.dart';

import '../../Global_Widgets.dart/Loading.dart';
import '../../Global_Widgets.dart/Photo_Blueprint.dart';
import '../Widgets/TabWidget.dart';

class Staff_Page extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;
    final db = DatabaseService();

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
          child: StreamBuilder<List<Photo_Blueprint>>(
              stream: db.staff_photos,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Photo_Blueprint>> snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("An error has occured!"),
                  );
                } else if (snapshot.hasData) {
                  var photos = snapshot.data ?? [];
                  List staff_photos = [];
                  for (var element in photos) {
                    staff_photos.add(element);
                  }
                    return staff_photos.isEmpty
                        ? const Center(child: Text("NO Post"))
                        : GridView.builder(
                            //controller: scrollController,
                            itemCount: staff_photos.length,
                            itemBuilder: (BuildContext context, int index) {
                              return StaffContainerWidget(
                                image: staff_photos[index].photo_url,
                                name: staff_photos[index].name,
                                gradeLevel: '8-12',
                                email: staff_photos[index].email,
                                position: staff_photos[index].position,
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              //childAspectRatio: 0.5,
                            ),
                          );
                  }
                  return Loading();
                }
              
              ),
        ),
      ],
    );
  }
}
