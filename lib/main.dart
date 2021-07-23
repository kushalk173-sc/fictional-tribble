/*
*  main.dart
*  Untitled — 23 August, 5.43.07 pm (1)
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xuberance2020/AboutUs.dart';
import 'package:xuberance2020/Events/EventsPage.dart';
import 'package:xuberance2020/HomePage.dart';
import 'package:xuberance2020/Login/PostLoginPage.dart';
import 'package:xuberance2020/Login/firstLoginMainPage.dart';
import 'package:xuberance2020/Rules.dart';
import 'package:xuberance2020/Teams/TeamsHomePage.dart';
import 'package:xuberance2020/youtube.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Login(),

    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => XuberanceHomePage()));
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('SplashScreen'),
      ),
    );
  }
}
