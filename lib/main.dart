// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:insta2/splashhscreen.dart';

void main(List<String> args) {
  runApp(myapp());
}

// ignore: camel_case_types
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashhscreen(),
    );
  }
}
