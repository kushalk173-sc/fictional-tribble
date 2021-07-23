import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xuberance2020/AnimatedBackground.dart';
import 'package:xuberance2020/Login/PostLoginPage.dart';
import 'package:xuberance2020/Login/Registation.dart';
import 'package:xuberance2020/values/colors.dart';

import 'AboutUs.dart';
import 'EventSchedule.dart';
import 'Events/EventsPage.dart';
import 'HomePage.dart';
import 'Login/firstLoginMainPage.dart';


class Sponsors extends StatelessWidget {
  Size displaySize(BuildContext context) {
    ////  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    ////debugPrint('Height = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    //debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:  Scaffold(
        drawer: Container(
          color: AppColors.Blue,
          child: Drawer(
            child: Container(
              color: AppColors.Blue,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 270,
                    child: Stack(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Positioned(
                              left: -100,
                              top: -100,
                              child: Opacity(
                                opacity: 0.5,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.Peach,
                                    radius: 180.0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: -80,
                              top: -80,
                              child: Opacity(
                                opacity: 0.5,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.Peach,
                                    radius: 150.0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: -30,
                              top: -30,
                              child: Opacity(
                                opacity: 0.7,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    // backgroundColor: primaryBackground,
                                    backgroundColor: AppColors.Peach,

                                    radius: 100.0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -20.0,
                              left: -20.0,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,

                                  radius: 100.0,
                                  child: Image.asset(
                                      "assets/images/bird.png"),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          title: Text('About Us',style: TextStyle(
                              fontFamily: 'atmosphere',
                              color: Colors.white,
                              fontSize: 20.0),),
                          leading: Container(width:40.0 ,child: Image.asset('assets/icon/about.png')),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AboutUs()));                                 // ...
                          },
                        ),

                        ListTile(
                          title: Text('Login',style: TextStyle(
                              fontFamily: 'atmosphere',
                              color: Colors.white,
                              fontSize: 20.0),),
                          leading: Image.asset('assets/icon/school.png'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Login()));                                 // ...
                          },
                        ),
                        ListTile(
                          title: Text('Schedule',style: TextStyle(
                              fontFamily: 'atmosphere',
                              color: Colors.white,
                              fontSize: 20.0),),
                          leading: Container(width:40.0,child: Image.asset('assets/icon/schedule.png')),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Schedule()));                                 // ...
                          },
                        ),
                        ListTile(
                          title: Text('Event',style: TextStyle(
                              fontFamily: 'atmosphere',
                              color: Colors.white,
                              fontSize: 20.0),),
                          leading: Image.asset('assets/icon/events.png'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EventsHomePage()));                                 // ...
                          },
                        ),
                        ListTile(
                          title: Text('Sponsors',style: TextStyle(
                              fontFamily: 'atmosphere',
                              color: Colors.white,
                              fontSize: 20.0),),
                          leading: Image.asset('assets/icon/sponsor.png' ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Sponsors()));                                 // ...
                          },
                        ),
                        ListTile(

                          title: Text('Teams',style: TextStyle(
                              fontFamily: 'atmosphere',
                              color: Colors.white,
                              fontSize: 20.0),),
                          leading: Image.asset('assets/icon/teams.png'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        XuberanceHomePage()));                                 // ...
                          },
                        ),

                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: Container(
                          height: 30.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                  right: 120.0, child: Icon(Icons.play_arrow , color: Colors.white,)),
                              Positioned(right: 85.0, child: Icon(Icons.face , color: Colors.white,)),
                              Positioned(left: 80.0, child: Icon(Icons.share , color: Colors.white,)),
                              Positioned(left: 120.0, child: Icon(Icons.add_a_photo , color: Colors.white,)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            AnimatedBackground(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(

                height: displayHeight(context) * 0.13,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: -80,
                      top: 4,
                      child: Container(
                        width: displayWidth(context) + 30,
                        height: displayHeight(context) * 0.12,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width:
                                displayWidth(context) + 30 - 80,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'Sponsors',
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontFamily: 'atmosphere',
                                          fontSize:
                                          (displayWidth(context) +
                                              30 -
                                              80) /
                                              (15),
                                          color:
                                          Colors.white                                  ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          color: AppColors.Blue,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),);
  }
}


