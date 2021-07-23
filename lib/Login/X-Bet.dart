//import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xuberance2020/HomePage.dart';
import '../values/colors.dart';

// ignore: avoid_web_libraries_in_flutter
//import 'dart:html' as html;

import 'Registation.dart';

class XbetHome extends StatelessWidget {
  final String code;

  const XbetHome({
    Key key,
    this.code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: XBet(code: code),
    );
  }
}

class XBet extends StatefulWidget {
  final String code;

  const XBet({Key key, this.code}) : super(key: key);

  @override
  _XBetState createState() => _XBetState(code);
}

class _XBetState extends State<XBet> {
  final String code;
  var firestore = Firestore.instance;
  PageController controller;
  Future state;
bool c = false;
  _XBetState(this.code);

  Future getEvents() async {
    QuerySnapshot querySnapshot;
    querySnapshot = await firestore
        .collection('schools').document(code).collection('logs')
        .getDocuments();
    return querySnapshot.documents;
  }

  @protected
  @mustCallSuper
  void initState() {
    state = getEvents();
  }

  Size displaySize(BuildContext context) {
    ////  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }
  int coins = 1000;

  Future _ackAlert(BuildContext context, AsyncSnapshot snapshot, int max,
      int index, List _controller ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Re-Check'),
          content: const Text(
              'Please Check if You are sure. This cannot be changed later on.'),
          actions: [

          FlatButton(
            child: Text("Okay"),
            onPressed: (){
             // Navigator.of(context).pop();

        c = true;
              Navigator.of(context).pop();
            },
          ),
          ],
        );
      },
    );
  }

  double displayHeight(BuildContext context) {
    ////debugPrint('Height = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    //debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }

//  _RegisterState({this.code});
  List<TextEditingController> _controllersPhone = new List();
  List<TextEditingController> _controllersName = new List();
  int re = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Blue,
      body: FutureBuilder(
        future: state,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              return Stack(
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
                                            'X-Bet',
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontFamily: 'atmosphere',
                                                fontSize:
                                                    (displayWidth(context) +
                                                            30 -
                                                            80) /
                                                        (15),
                                                color: Colors.black),
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
                                color: AppColors.Peach,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Positioned(
                        right: displayWidth(context) * 0.0001,
                        left: displayWidth(context) *0.0001,
                        top: displayHeight(context) * 0.2,
                        child: Center(
                            child: Container(
                          width: 450.0,
                          child: Center(
                            child: AutoSizeText(
                           "You Have \n$coins X-Points Left",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'atmosphere',
                                  color: Colors.white,
                                  fontSize: 24.0),
                            ),
                          ),
                        )),
                      ),
                      Positioned(
                        right: displayWidth(context) * 0.125,
                        top: displayHeight(context) * 0.275,
                        child: Center(
                          child: Container(
                            height: displayHeight(context) * 0.6,
                            width: displayWidth(context) * 0.75,
                            child: Center(
                              child:  ListView.builder(
                                itemCount: 7,
                                itemBuilder: (BuildContext context, int index) {
                                  _controllersPhone
                                      .add(new TextEditingController());
                                  _controllersName
                                      .add(new TextEditingController());
//re = 0;
                                  String name1 = '', phone = '';
                                  //  if(index == 0 ){}
                                  if (index == 6) {
                                    return Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipOval(
                                            child: Container(

                                                width: 100.0,
                                                child: RaisedButton(

                                                  color: AppColors.Blue,
                                                  child: Text("Submit"),
                                                  onPressed: () {

if(!c)
                                                    _ackAlert(context , snapshot ,7,index,_controllersPhone);
else{
  for ( int i = 0; i < 6 ; i++)
    _controllersPhone[i].clear();
}
                                                  },
                                                )),
                                          ),
                                        ));
                                  }
                                  return ListTile(
title: Text(snapshot.data[index].data['name']),
                                    trailing: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 100,
                                        child: TextField(
                                          decoration: new InputDecoration(
                                              border: new OutlineInputBorder(
                                                  borderSide: new BorderSide(color: Colors.teal)),
                                              //hintText: 'Tell us about yourself',
                                             // helperText: 'Keep it short, this is just a demo.',
                                              labelText: 'X-points',

                                              //prefixText: ' ',
                                            //  suffixText: 'USD',
                                          //    suffixStyle: const TextStyle(color: Colors.green)
                                  ),

                                          autofocus: true,
                                          keyboardType:
                                          TextInputType.number,
                                          //decoration: new InputDecoration(labelText: 'phone'),
                                          controller:
                                          _controllersPhone[
                                          index],
                                          onChanged: (value) {
                                           setState(() {
                                             int one = 0;
                                             phone = '';
                                             phone = value ;
                                             if (phone.length == 1)re =0;
                                             coins +=re;

                                             one = int.parse(phone);
                                             value = '';
                                             coins -= one;
                                             re = one;

                                           });
//                                    participants[q]= Participant(snapshot.data[position].data['name'],name1,phone);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: AppColors.Peach,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
