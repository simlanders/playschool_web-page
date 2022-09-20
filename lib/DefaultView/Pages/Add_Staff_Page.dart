import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:playschool/DefaultView/Pages/Image_Picker.dart';

import '../Widgets/TabWidget.dart';

class Add_Staff_Page extends StatefulWidget {
  @override
  State<Add_Staff_Page> createState() => _Add_Staff_Page_State();

  final String? name;

  final String? start_age_group;

  final String? end_age_group;

  final String? position;

  final String? email;

  String? url;

  Add_Staff_Page({
    this.start_age_group,
    this.end_age_group,
    required this.position,
    required this.name,
    required this.email,
    this.url,
  });
}

const List<String> list = <String>[
  'Infant',
  'One',
  'Two',
  'Three',
  'Four',
  'Five',
  'Six',
  'Seven',
  'Eight',
  'Nine',
  'Ten',
  'Eleven',
  'Twelve'
];

class _Add_Staff_Page_State extends State<Add_Staff_Page> {
  final _formKey = GlobalKey<FormState>();
  final storageRef = FirebaseStorage.instance.ref();
  late TextEditingController _name;
  late TextEditingController _position;
  late TextEditingController _email;
  late String dropdownValue;
  late String dropdownValue2;

  
  @override
  initState() {
    super.initState();
    _name = TextEditingController(text: widget.name);
    _position = TextEditingController(text: widget.position);
    _email = TextEditingController(text: widget.email);

    if (widget.url == '') {
      widget.url =
          'https://firebasestorage.googleapis.com/v0/b/playschool-fae76.appspot.com/o/staffPics%2Fphoto-coming-soon-002.jpg?alt=media&token=76acf0d0-78f1-4af1-bc0d-2bdd643cd53d';
    }
    if (widget.start_age_group == '') {
      dropdownValue = list.first;
    } else {
      dropdownValue = widget.start_age_group!;
    }
    if (widget.end_age_group == '') {
      dropdownValue2 = list.last;
    } else {
      dropdownValue2 = widget.end_age_group!;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.yellow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.blueGrey,
                  width: (MediaQuery.of(context).size.width) / 1.8,
                  height: (MediaQuery.of(context).size.height) / 1.5,
                  alignment: Alignment.topLeft,
                  child: Image.network(widget.url!),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: ((MediaQuery.of(context).size.width) / 1.8) / 2.8,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Image_Picker(
                                      email: _email.text,
                                      folder: 'staffPics/',
                                      name: _name.text,
                                      position: _position.text,
                                      end_age_group: dropdownValue2,
                                      start_age_group: dropdownValue,
                                    )));
                      },
                      child: Text(
                        "Select Picture",
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.red))))),
                ]),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width) / 3,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.brown,
                  child: Scaffold(
                      backgroundColor: Colors.amber,
                      body: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Please enter Staff Details ",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.greenAccent),
                              ),
                              TextFormField(
                                
                                controller: _name,
                                obscureText: false,
                                decoration: InputDecoration(
                                    labelText: "Name",
                                    labelStyle: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "PassWord can not be empty";
                                  }
                                  if (value.length < 4) {
                                    return "Password too Short ";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                
                                controller: _email,
                                decoration: InputDecoration(
                                    labelText: "Email",
                                    labelStyle: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Email can not be empty";
                                  }
                                  if (!value.contains('@')) {
                                    return "Email In The Wrong Format";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                               
                                controller: _position,
                                obscureText: false,
                                decoration: InputDecoration(
                                    labelText: "Position",
                                    labelStyle: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "PassWord can not be empty";
                                  }
                                  if (value.length < 4) {
                                    return "Password too Short ";
                                  }
                                  return null;
                                },
                              ),
                              Text('Select the age group this staff serves'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Start Age'),
                                  DropdownButton<String>(
                                    value: dropdownValue,
                                    icon: const Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    onChanged: (String? value) async {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        dropdownValue = value!;
                                      });
                                    },
                                    items: list.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                  Text('End Age'),
                                  DropdownButton<String>(
                                    value: dropdownValue2,
                                    icon: const Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    onChanged: (String? value) async {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        dropdownValue2 = value!;
                                      });
                                    },
                                    items: list.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    OutlinedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {}
                                        },
                                        child: Text("Submit")),
                                  ]),
                            ],
                          ))),
                ),
              ],
            ),
          ],
        ));
  }
}
