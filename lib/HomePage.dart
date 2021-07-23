import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:xuberance2020/AboutUs.dart';
import 'package:xuberance2020/EventSchedule.dart';
import 'package:xuberance2020/Sponsors.dart';
import 'Events/EventsPage.dart';
import 'Login/firstLoginMainPage.dart';
import 'values/values.dart';

class XuberanceHomePage extends StatelessWidget {
  static const Color primaryBackground = Color.fromARGB(255, 247, 207, 186);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            //background
            Positioned(
              left: -172,
              right: 0,
              child: Image.asset(
                "assets/images/Home_BackGround.png",
                fit: BoxFit.cover,
              ),
            ),
            //background filter
            Positioned(
              left: 0,
              right: 0,
              child: Opacity(
                opacity: 0.25,
                child: Container(
                  height: 1500,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBackground,
                    border: Border.fromBorderSide(Borders.secondaryBorder),
                  ),
                  child: Container(),
                ),
              ),
            ),
// the main widget tree
            Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //xuberance TExt- wrapped in an auto size- gonna resize based on screen size
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 2,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AutoSizeText(
                          "Xuberance '20 ",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'atmosphere',
                            color: Colors.white,
                            fontSize: 64,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //the circles and the main design
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 10,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        //Xuberance Bird

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Opacity(
                            opacity: 0.60,
                            child: Image.asset(
                              "assets/images/XuberanceBird.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          left: -300,
                          child: Center(
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Stack(
                                    overflow: Overflow.visible,
                                    children: <Widget>[
                                      Container(
                                        width: 500,
                                        height: 500,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 10,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(250)),
                                        ),
                                      ),

                                      //school Profile
//                                      Positioned(
//                                        left: 275,
//                                        bottom: 460,
//                                        child: Row(
//                                          children: <Widget>[
//                                            new GestureDetector(
//                                              // ignore: unnecessary_statements
//                                              onTap: () {
//                                                Navigator.push(
//                                                    context,
//                                                    MaterialPageRoute(
//                                                        builder: (context) =>
//                                                            EventsHomePage()));
//                                              },
//                                              child: CircleAvatar(
//                                                radius: 32,
//                                                backgroundColor: Colors.black,
//                                                child: CircleAvatar(
//                                                  // backgroundColor: primaryBackground,
//                                                  backgroundImage: AssetImage(
//                                                      'assets/images/Home_BackGround.png'),
//                                                  radius: 30.0,
//                                                  child: Image.asset(
//                                                      "assets/images/iconPlaceHolder.png"),
//                                                ),
//                                              ),
//                                            ),
//                                            new Padding(
//                                              padding:
//                                                  EdgeInsets.only(left: 16.0),
//                                              child: AutoSizeText(
//                                                "School Profile",
//                                                maxLines: 1,
//                                                textAlign: TextAlign.left,
//                                                style: TextStyle(
//                                                  color: Colors.white,
//                                                  fontWeight: FontWeight.w900,
//                                                  fontSize: 20,
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//
                                      Positioned(
                                        left: 375,
                                        bottom: 405,
                                        child: Row(
                                          children: <Widget>[
                                            new GestureDetector(
                                              // ignore: unnecessary_statements
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            AboutUs()));                                                },
                                              child: CircleAvatar(
                                                radius: 32,
                                                backgroundColor: Colors.black,
                                                child: CircleAvatar(
                                                  // backgroundColor: primaryBackground,
                                                  backgroundImage: AssetImage(
                                                      'assets/images/back.png'),
                                                  radius: 30.0,
                                                  child: Container(
                                                    width: 30.0,
                                                    child: Image.asset(
                                                        "assets/icon/about.png"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            new Padding(
                                              padding:
                                                  EdgeInsets.only(left: 16.0),
                                              child: AutoSizeText(
                                                "About Us",
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
//                                      //Events
                                      Positioned(
                                        left: 440,
                                        bottom: 325,
                                        child: Row(
                                          children: <Widget>[
                                            new GestureDetector(
                                              // ignore: unnecessary_statements
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Login()));                                              },
                                              child: CircleAvatar(
                                                radius: 32,
                                                backgroundColor: Colors.black,
                                                child: CircleAvatar(
                                                  // backgroundColor: primaryBackground,
                                                  backgroundImage: AssetImage(
                                                      'assets/images/back.png'),
                                                  radius: 30.0,
                                                  child: Container(
                                                    width: 30.0,

                                                    child: Image.asset(
                                                        "assets/icon/school.png"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            new Padding(
                                              padding:
                                                  EdgeInsets.only(left: 16.0),
                                              child: AutoSizeText(
                                                "School Profile",
                                                maxLines: 2,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      //About us
                                      Positioned(
                                        left: 465,
                                        bottom: 230,
                                        child: Row(
                                          children: <Widget>[
                                            new GestureDetector(
                                              // ignore: unnecessary_statements
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Schedule()));                                               },
                                              child: CircleAvatar(
                                                radius: 32,
                                                backgroundColor: Colors.black,
                                                child: CircleAvatar(
                                                  // backgroundColor: primaryBackground,
                                                  backgroundImage: AssetImage(
                                                      'assets/images/back.png'),
                                                  radius: 30.0,
                                                  child: Container(
                                                    width: 30.0,

                                                    child: Image.asset(
                                                        "assets/icon/schedule.png"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            new Padding(
                                              padding:
                                                  EdgeInsets.only(left: 16.0),
                                              child: AutoSizeText(
                                                "Schedule",
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //Sponsors
                                      Positioned(
                                        left: 445,
                                        bottom: 125,
                                        child: Row(
                                          children: <Widget>[
                                            new GestureDetector(
                                              // ignore: unnecessary_statements
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EventsHomePage()));                                             },
                                              child: CircleAvatar(
                                                radius: 32,
                                                backgroundColor: Colors.black,
                                                child: CircleAvatar(
                                                  // backgroundColor: primaryBackground,
                                                  backgroundImage: AssetImage(
                                                      'assets/images/back.png'),
                                                  radius: 30.0,
                                                  child: Container(
                                                    width: 30.0,

                                                    child: Image.asset(
                                                        "assets/icon/events.png"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            new Padding(
                                              padding:
                                                  EdgeInsets.only(left: 16.0),
                                              child: AutoSizeText(
                                                "Events",
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //Login
                                      Positioned(
                                        left: 380,
                                        bottom: 40,
                                        child: Row(
                                          children: <Widget>[
                                            new GestureDetector(
                                              // ignore: unnecessary_statements
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Sponsors()));                                               },
                                              child: CircleAvatar(
                                                radius: 32,
                                                backgroundColor: Colors.black,
                                                child: CircleAvatar(
                                                  // backgroundColor: primaryBackground,
                                                  backgroundImage: AssetImage(
                                                      'assets/images/back.png'),
                                                  radius: 30.0,
                                                  child: Container(
                                                    width: 30.0,

                                                    child: Image.asset(
                                                        "assets/icon/sponsor.png"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            new Padding(
                                              padding:
                                                  EdgeInsets.only(left: 16.0),
                                              child: AutoSizeText(
                                                "Sponsors",
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //Event Schedule
//                                      Positioned(
//                                        left: 275,
//                                        bottom: -15,
//                                        child: Row(
//                                          children: <Widget>[
//                                            new GestureDetector(
//                                              // ignore: unnecessary_statements
//                                              onTap: () {
//                                                Navigator.push(
//                                                    context,
//                                                    MaterialPageRoute(
//                                                        builder: (context) =>
//                                                            Schedule()));                                                },
//                                              child: CircleAvatar(
//                                                radius: 32,
//                                                backgroundColor: Colors.black,
//                                                child: CircleAvatar(
//                                                  // backgroundColor: primaryBackground,
//                                                  backgroundImage: AssetImage(
//                                                      'assets/images/Home_BackGround.png'),
//                                                  radius: 30.0,
//                                                  child: Image.asset(
//                                                      "assets/images/iconPlaceHolder.png"),
//                                                ),
//                                              ),
//                                            ),
//                                            new Padding(
//                                              padding:
//                                                  EdgeInsets.only(left: 16.0),
//                                              child: AutoSizeText(
//                                                "Schedule",
//                                                maxLines: 1,
//                                                textAlign: TextAlign.left,
//                                                style: TextStyle(
//                                                  color: Colors.white,
//                                                  fontWeight: FontWeight.w900,
//                                                  fontSize: 20,
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
