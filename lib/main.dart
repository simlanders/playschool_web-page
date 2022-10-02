import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'DefaultView/Pages/D_Home.dart';
import 'Global_Widgets.dart/Loading.dart';
import 'MobileView/Pages/M_Home.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _init = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        initialData: _init,
        future: _init,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            if (snapshot.error.toString() ==
                '[core/duplicate-app] A Firebase App named "[DEFAULT]" already exists') {
              final FirebaseFirestore _firestore = FirebaseFirestore.instance;
              return MyHomePage();
            }
            return Center(
              child: Text(
                  "Ooops an Error has Happened " + snapshot.error.toString()),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final FirebaseFirestore _firestore = FirebaseFirestore.instance;
            return MyHomePage();
          }

          return Loading();
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final type = MediaQueryData.fromWindow(WidgetsBinding.instance.window);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context).size.shortestSide;
    try {
      if (widget.type.size.shortestSide < 600) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const M_Home()));
        });
      } else {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => D_Home()));
        });
      }
      // ignore: empty_catches
    } catch (e) {
      return const Text("Error Sizing page");
    }
    return Loading();
  }
}
