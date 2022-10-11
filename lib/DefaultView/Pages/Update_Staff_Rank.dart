import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Global_Classes.dart/Database.dart';
import '../../Global_Widgets.dart/Loading.dart';
import '../../Global_Widgets.dart/Photo_Blueprint.dart';

class Update_Staff_Rank extends StatefulWidget {
  @override
  State<Update_Staff_Rank> createState() => _Update_Staff_Rank_State();
}

class _Update_Staff_Rank_State extends State<Update_Staff_Rank> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseService db = new DatabaseService();
  late double int_rank;
  List<int> list = <int>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Update Photo Rank"),
          titleSpacing: 10,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
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

                    UpdateRankList(staff_photos.length);

                    return staff_photos.isEmpty
                        ? const Center(child: Text("NO Photos"))
                        : ListView.builder(
                            itemCount: staff_photos.length,
                            itemBuilder: (BuildContext context, int index) {
                              int dropdownValue = int.parse(staff_photos[index].order_number);

                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(staff_photos[index].name),
                                      Text('Update the photos position'),
                                      DropdownButton<int>(
                                        value: dropdownValue,
                                        icon: const Icon(Icons.arrow_downward),
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Colors.deepPurple),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        onChanged: (int? value) async {
                                          // This is called when the user selects an item.
                                          setState(() {
                                            dropdownValue = value!;
                                          });
                                        },
                                        items: list.map<DropdownMenuItem<int>>(
                                            (int value) {
                                          return DropdownMenuItem<int>(
                                            value: value,
                                            child: Text(value.toString()),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            });
                  }
                  return Loading();
                },
              ),
            ),
          ],
        ));
  }

  void updateOrder_Number(index, rank) async {

  }
  void UpdateRankList(int numberOfPhotos) {
    for (int i = 0; i <= numberOfPhotos; i++) {
      list.add(i);
    }
  }
}
