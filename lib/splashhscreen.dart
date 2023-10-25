// ignore_for_file: camel_case_types, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:insta2/homesscreen.dart';
import 'package:insta2/loginnscreen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class splashhscreen extends StatefulWidget {
  const splashhscreen({super.key});

  @override
  State<splashhscreen> createState() => _splashscreenState();
}

const String SAVE_KEY_NAME = 'UserLoggedIn';
bool? alreadyLogged;

class _splashscreenState extends State<splashhscreen> {
  @override
  void initState() {
    decidescreen().whenComplete(() async {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                alreadyLogged == true ? const homesscreen() : loginnscreen()));
      });
    });
    super.initState();
  }

  decidescreen() async {
    final sp = await SharedPreferences.getInstance();
    alreadyLogged = sp.getBool(SAVE_KEY_NAME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 520,
              child: Image.asset(
                'assets/images/pngegg.png',
                height: 0,
                width: 100,
              ),
            ),
            Image.asset(
              'assets/images/Instagram-Meta-Logo-PNG-1.png',
              width: 70,
              height: 90,
            )
          ],
        ),
      ),
    );
  }
}
