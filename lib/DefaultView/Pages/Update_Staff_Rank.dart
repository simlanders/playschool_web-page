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
                stream: db.photos,
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
                        ? const Center(child: Text("NO Photos"))
                        : ListView.builder(
                            itemCount: staff_photos.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Text(staff_photos[index].name));
                  }
                  return Loading();
                },
              ),
            ),
          ],
        ));
  }

  void addRank(new_rank) async {
    
  }
}