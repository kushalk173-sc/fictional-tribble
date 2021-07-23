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
import 'Sponsors.dart';

class AboutUs extends StatelessWidget {
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

  String _stringext =
      "\t\t\tEver since it was established in 1860, St. Xavier\’s Collegiate School has aimed at moulding students into dignified and capable gentlemen. Over the years, the school has infused a variety of extra-curricular activities into its curriculum to promote leadership skills, confidence, maturity and ensure the holistic development of its students.\n\n\t\t\tAt St. Xavier\’s, the idea of \“Acta non Verba\” or \“actions, not words\” always rings true and the achievements,the victories, the successes and even the occasional failures that bear our name are atestament to that belief. Even in adverse times such as the present, our inextinguishable determination gives us the strength to carry on against all odds.\n\n\t\t\tInter-school fests provide a natural step towards accomplishing this goal by aiding the growth of interpersonal and management skills, bringing different schools together and providing an exhilarating platform for students to display their talents. For this reason, St. Xavier\’s Collegiate School is proud to present X-Uberance \’20: Far but Together, a stepping-stone for the learners of today to become the leaders of tomorrow.\n\n\t\t\tAmidst the uncertainty of our current situation, X-Uberance \’20 provides an opportunity for students to unite in solidarity despite the challenges we are all facing, to bring out the best in every student. From ambitious entrepreneurs to keen quizzers and elegant dancers - even on a virtual platform, X-Uberance strives to give every student the chance to showcase their passion. Such events go a long way in strengthening qualities such as teamwork and patience, invaluable in the fast-paced modern world; whilst encouraging a spirit of healthy competition. Always in the service of our less fortunate brethren, especially in such trying times, we shall also make contributions towards various social causes.\n\n\t\t\tTaking place over the course of 2 days and catering to hundreds of students from top-notch schools across the city, X-Uberance \’20 is our attempt to unite education with innovation and redefine the boundaries of possibility.";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            Column(
              children: <Widget>[
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
                                    width: displayWidth(context) + 30 - 80,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text(
                                          'About Us',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontFamily: 'atmosphere',
                                              fontSize: (displayWidth(context) +
                                                      30 -
                                                      80) /
                                                  (15),
                                              color: Colors.white),
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
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                          height: 250.0,
                          child: Image.asset("assets/images/logo.png")),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: AutoSizeText(
                            "About Xavier's",
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'atmosphere',
                              fontWeight: FontWeight.w900,
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Container(
                                width: displayWidth(context),
                               // height: displayHeight(context) * 0.77,
                                child: AutoSizeText(
                                  _stringext,
                                  minFontSize: 16,
                                  maxLines: 75,
                                ))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
