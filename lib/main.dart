import 'package:flutter/material.dart';
import 'package:projet1/interfaces/cgu.dart';
import 'package:projet1/interfaces/pwd.dart';

import 'interfaces/home.dart';
import 'interfaces/auth.dart';

void main() {
  runApp(const AppGl());
}

class AppGl extends StatefulWidget {
  const AppGl({super.key});

  @override
  State<AppGl> createState() => _AppGlState();
}

class _AppGlState extends State<AppGl> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: Home(),
      //   home: CguScreen(
      //     onNext: (index) {},
      //     // greettings: "Salutations à tout le monde qui ont des ",
      //   ),
    );
  }
}
