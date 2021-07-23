import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xuberance2020/Events/SwipeDetector.dart';
import '../AnimatedBackground.dart';

import '../EventSchedule.dart';
import 'EventDetails.dart';
import 'EventListItem.dart';
import 'EventsPage.dart';
import '../Login/firstLoginMainPage.dart';
import '../AboutUs.dart';
import '../HomePage.dart';
import '../Sponsors.dart';
import '../values/colors.dart';

class EventRules extends StatelessWidget {
  final String stringName;
  final String stringRule;


  const EventRules({Key key, this.stringName, this.stringRule, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListPage(rules: stringRule, name: stringName,));
  }
}

class ListPage extends StatefulWidget {
  final String rules ;
  final String name;

  const ListPage({Key key, this.rules, this.name}) : super(key: key);
  @override
  _ListPageState createState() => _ListPageState(name,rules);
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      color: Colors.black, //                   <--- border color
      width: 1.0,
    ),
  );
}

class _ListPageState extends State<ListPage> {
  final String rules ;

  //var name;
 final String name;

  _ListPageState(  this.name, this.rules);



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
    return Scaffold(

      //appBar: AppBar(backgroundColor: Colors.transparent,),
      body: gDec(
        page: 'EventsHome',
        child: Stack(
          children: <Widget>[
            AnimatedBackground(),
            Center(
              child: Container(
                height: displayHeight(context),
                width: displayWidth(context),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: displayHeight(context) * 0.15,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            right: -200,
                            top: 20,
                            child: Container(
                              width: displayWidth(context) + 30,
                              height: displayHeight(context) * 0.12,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: displayWidth(context) + 30 - 200,
                                      child: Center(
                                        child: Text(
                                          'Rules',
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80.0),
                                color: AppColors.Blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              width: displayWidth(context) - 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: AppColors.Peach,
                              ),
                              child: Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Center(
                                        child: Text(
                                          name,
                                          style: TextStyle(
                                              fontFamily: 'atmosphere',
                                              color: Colors.white,
                                              fontSize: 24.0),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 5.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: Container(
                                              width: displayWidth(context),

                                              // height: displayHeight(context) * 0.77,

                                              child: AutoSizeText(
                                              rules,
                                                minFontSize: 16,
                                                maxLines: 20,
                                              ))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),

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
    );
  }

}
