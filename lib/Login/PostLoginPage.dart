import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xuberance2020/HomePage.dart';
import 'package:xuberance2020/Login/X-Bet.dart';
import '../values/colors.dart';
// ignore: avoid_web_libraries_in_flutter
//import 'dart:html' as html;

import 'Registation.dart';

class PostLoginPage extends StatelessWidget {
  final String email;

  const PostLoginPage({
    Key key,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostLoginMainPage(email: email),
    );
  }
}

class PostLoginMainPage extends StatefulWidget {
  final String email;

  const PostLoginMainPage({Key key, this.email}) : super(key: key);

  @override
  _PostLoginMainPageState createState() => _PostLoginMainPageState(email);
}

class _PostLoginMainPageState extends State<PostLoginMainPage> {
  final String mail;
  final Firestore _firestore = Firestore.instance;

  _PostLoginMainPageState(this.mail);

  String code;
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
  Future getSchoolData() async {
    code = mail.substring(0, mail.indexOf('@'));
    var firestore = Firestore.instance;
    QuerySnapshot querySnapshot;
    querySnapshot = await firestore
        .collection('schools')
        .where('code', isEqualTo: code)
        .getDocuments();

    return querySnapshot.documents;
  }

  Future _asyncSimpleDialog(BuildContext context) async {
    String emailSend = '';
    final Uri url = Uri(
        scheme: 'http',
        path: 'www.woolha.com',
        queryParameters: {
          'name': 'Woolha dot com',
          'about': 'Flutter Dart'
        }
    );
String url2 = "https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget/43604420";
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return MaterialApp(
            home: SimpleDialog(
              backgroundColor: AppColors.Peach,
              title: const Text('How Do You want to Submit?'),
              children: [
                SimpleDialogOption(
                  onPressed: () {
Clipboard.setData(ClipboardData(text: url2));
                  },
                  child:  Row(children: <Widget>[
                     Icon(Icons.content_copy), Padding(
                       padding: const EdgeInsets.only(left: 8.0),
                       child: Text('Copy Link',style: TextStyle(
                        fontFamily: 'atmosphere',

                    ),),
                     )
                  ],),
                ),
                SimpleDialogOption(
                  onPressed: () {
launch(url2);              },
                  child:  Row(
                    children: <Widget>[
                      Icon(Icons.web),
                      Padding(
                        padding: const EdgeInsets.only(left : 8.0),
                        child: Text('Go To Link',style: TextStyle(
                          fontFamily: 'atmosphere',

                        ),),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SimpleDialogOption(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                            children: <Widget>[
                               Icon(Icons.alternate_email),
                               Padding(
                                 padding: const EdgeInsets.only(left: 8.0),
                                 child: Text('Get Link Via Email',style: TextStyle(
                                  fontFamily: 'atmosphere',

                              ),),
                               )
                            ],),
                          ),
                          new TextField(
                            autofocus: true,
                            decoration:
                                new InputDecoration(labelText: 'Email ID'),
                            onChanged: (value) {
                              emailSend = value;
                            },
                          ),
                          RaisedButton(
                            child: Text("Send Request"),
                            onPressed: () {
                              if (emailSend.length > 0)
                                _firestore.collection('Email').add({
                                  'email': emailSend,
                                });
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Blue,
      body: Stack(
        children: <Widget>[
//          Positioned(
//            left: -172,
//            right: 0,
//            child: Image.asset(
//              "assets/images/Home_BackGround.png",
//              fit: BoxFit.cover,
//            ),
//          ),
          Padding(
            padding: const EdgeInsets.only(top:16.0),
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
                              displayWidth(context) + 30 - 100,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child:  FutureBuilder(
                                      future: getSchoolData(),
                                      // ignore: missing_return
                                      builder: (context, snapshot) {
return AutoSizeText(
  "St. Xavier's Collegiate School",
  maxLines: 1,
  style: TextStyle(
      fontFamily: 'atmosphere',
      fontSize:
      (displayWidth(context) +
          30 -
          80) /
          (20),
      color:
      Colors.white                                  ),
  textAlign: TextAlign.left,
);
                                      }),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        color: AppColors.Peach,

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Center(
            child: Container(
              height: displayHeight(context) * 0.6,
              width: displayWidth(context) * 0.75,
              child: Center(
                child: Stack(
                  children: [
                    // ignore: unnecessary_statements

                    Positioned(
                      top:displayHeight(context) * 0.125,
right: displayWidth(context) * 0.01,
                      left: displayWidth(context) * 0.01,
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Registrations(
                                              code: code,
                                            )));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(80.0),
                                      color: AppColors.Blue,

                                    ),
                                    height: 48.0,

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text("Registration", style: TextStyle(
                                            fontFamily: 'atmosphere',
                                            fontSize:
                                            (displayWidth(context) +
                                                30 -
                                                80) /
                                                (15),
                                            color:
                                            Colors.white                                  )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0,),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => XBet(
                                              code: code,
                                            )));                                  },
                                  child: Container(
                                    height: 48.0,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(80.0),
                                      color: AppColors.Blue,

                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text("X-Bet", style: TextStyle(
                                            fontFamily: 'atmosphere',
                                            fontSize:
                                            (displayWidth(context) +
                                                30 -
                                                80) /
                                                (15),
                                            color:
                                            Colors.white                                  )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0,),

                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: GestureDetector(
                                  onTap: () {
                                    _asyncSimpleDialog(context);
                                  },
                                  child: Container(
                                    height: 48.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(80.0),
                                        color: AppColors.Blue,

                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text("Submissions", style: TextStyle(
                                          fontFamily: 'atmosphere',
                                          fontSize:
                                          (displayWidth(context) +
                                              30 -
                                              80) /
                                              (15),
                                          color:
                                          Colors.white                                  ),),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: AppColors.Peach,

              ),
            ),
          ),        ],
      ),
    );
  }
}
