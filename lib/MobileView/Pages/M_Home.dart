import 'package:flutter/material.dart';

class M_Home extends StatelessWidget {
  const M_Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
             Text(
              'This Web Page is under construction.\n+ For Mobile screens and smaller!!!',
              style: TextStyle(color: Colors.green , fontSize: 35),
            )
        ],
      ),
    );
  }
}