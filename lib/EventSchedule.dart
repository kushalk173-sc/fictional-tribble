import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'AnimatedBackground.dart';

import 'Events/EventDetails.dart';
import 'Events/EventListItem.dart';
import 'Events/EventsPage.dart';
import 'Login/firstLoginMainPage.dart';
import 'AboutUs.dart';
import 'HomePage.dart';
import 'Sponsors.dart';
import 'values/colors.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListPage());
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
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
  int _currentIndex = 0;

  Future getEvents2() async {
    var firestore = Firestore.instance;
    QuerySnapshot querySnapshot;
    if (_currentIndex == 0) {
      querySnapshot = await firestore
          .collection('event_schedule')
          .where("day", isEqualTo: 2)
          .where("type", isEqualTo: "Live")
          .getDocuments();
    } else if (_currentIndex == 1) {
      querySnapshot = await firestore
          .collection('event_schedule')
          .where("day", isEqualTo: 2)
          .where("type", isEqualTo: "Broadcast")
          .getDocuments();
    } else if (_currentIndex == 2) {
      querySnapshot = await firestore
          .collection('event_schedule')
          .where("day", isEqualTo: 2)
          .where("type", isEqualTo: "Entry-based")
          .getDocuments();
    } else {
      querySnapshot = await firestore
          .collection('event_schedule')
          .where("day", isEqualTo: 2)
          .where("type", isEqualTo: "Group")
          .getDocuments();
    }

    return querySnapshot.documents;
  }

  Future getEvents1() async {
    var firestore = Firestore.instance;
    QuerySnapshot querySnapshot;
    if (_currentIndex == 0) {
      querySnapshot = await firestore
          .collection('event_schedule')
          .where("day", isEqualTo: 1)
          .where("type", isEqualTo: "Live")
          .getDocuments();
    } else if (_currentIndex == 1) {
      querySnapshot = await firestore
          .collection('event_schedule')
          .where("day", isEqualTo: 1)
          .where("type", isEqualTo: "Broadcast")
          .getDocuments();
    } else if (_currentIndex == 2) {
      querySnapshot = await firestore
          .collection('event_schedule')
          .where("day", isEqualTo: 1)
          .where("type", isEqualTo: "Entry-based")
          .getDocuments();
    } else {
      querySnapshot = await firestore
          .collection('event_schedule')
          .where("day", isEqualTo: 1)
          .where("type", isEqualTo: "Group")
          .getDocuments();
    }

    return querySnapshot.documents;
  }

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
                                child: Image.asset("assets/images/bird.png"),
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
                        title: Text(
                          'About Us',
                          style: TextStyle(
                              fontFamily: 'atmosphere',
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        leading: Container(
                            width: 40.0,
                            child: Image.asset('assets/icon/about.png')),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUs())); // ...
                        },
                      ),

                      ListTile(
                        title: Text(
                          'Schedule',
                          style: TextStyle(
                              fontFamily: 'atmosphere',
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        leading: Container(
                            width: 40.0,
                            child: Image.asset('assets/icon/schedule.png')),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Schedule())); // ...
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Event',
                          style: TextStyle(
                              fontFamily: 'atmosphere',
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        leading: Image.asset('assets/icon/events.png'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EventsHomePage())); // ...
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Sponsors',
                          style: TextStyle(
                              fontFamily: 'atmosphere',
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        leading: Image.asset('assets/icon/sponsor.png'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Sponsors())); // ...
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Teams',
                          style: TextStyle(
                              fontFamily: 'atmosphere',
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                        leading: Image.asset('assets/icon/teams.png'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      XuberanceHomePage())); // ...
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
                                right: 120.0,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                )),
                            Positioned(
                                right: 85.0,
                                child: Icon(
                                  Icons.face,
                                  color: Colors.white,
                                )),
                            Positioned(
                                left: 80.0,
                                child: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                )),
                            Positioned(
                                left: 120.0,
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                )),
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

      //appBar: AppBar(backgroundColor: Colors.transparent,),
      body: Stack(
        children: <Widget>[
          AnimatedBackground(),
          Center(
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
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: displayWidth(context) + 30 - 200,
                                      child: Center(
                                        child: Text(
                                          'Schedule',
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
                                    SizedBox(height: 4.0,),
                                  ],
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
                                "DAY 1",
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
                          FutureBuilder(
                              future: getEvents1(),

                              // ignore: missing_return

                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator(
                                    backgroundColor: AppColors.Blue,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColors.Peach),
                                  ));
                                } else {
                                  return Container(
                                    child: Expanded(
                                      child: ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: <Widget>[
                                              Container(
                                                height: 40.0,
                                                child: ListTile(
                                                  title: AutoSizeText(

                                                    snapshot
                                                        .data[index].data['name'],
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontFamily: 'atmosphere',
                                                        color: Colors.black,
                                                        fontSize: 24.0),
                                                  ),
                                                  trailing: AutoSizeText(
                                                    snapshot
                                                        .data[index].data['time'],
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontFamily: 'atmosphere',
                                                        color: Colors.black,
                                                        fontSize: 16.0),
                                                  ),
                                                ),
                                              ),
                                                                                  SizedBox(height: 4.0,),

                                            ],
                                          );
                                        },
                                      ),
//                                      child: GridView.count(
//                                        // Create a grid with 2 columns. If you change the scrollDirection to
//
//                                        // horizontal, this produces 2 rows.
//
//                                        crossAxisCount: 1,
//
//                                        // Generate 100 widgets that display their index in the List.
//
//                                        children: List.generate(
//                                            , (index) {
//
//                                        }),
//                                      ),
                                    ),
                                  );
                                }

                                //return Visibility(visible: false,child: Column(),);
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
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
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "DAY 2",
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
                          FutureBuilder(
                              future: getEvents2(),
                              // ignore: missing_return
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator(
                                    backgroundColor: AppColors.Blue,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColors.Peach),
                                  ));
                                } else {
                                  return Expanded(
                                      child: ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                          return Container(
                                            height: 40.0,
                                            child: ListTile(
                                              title: AutoSizeText(
                                                snapshot
                                                    .data[index].data['name'],
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontFamily: 'atmosphere',
                                                    color: Colors.black,
                                                    fontSize: 24.0),
                                              ),
                                              trailing: AutoSizeText(
                                                snapshot
                                                    .data[index].data['time'],
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontFamily: 'atmosphere',
                                                    color: Colors.black,
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                          );
                                    },
                                  ));
                                }
                              }),
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

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            title: Text("Live"),
            backgroundColor: AppColors.Peach,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            title: Text("Recorded"),
            backgroundColor: AppColors.Peach,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.transit_enterexit),
            title: Text("Entry-Based"),
            backgroundColor: AppColors.Peach,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text("Group"),
            backgroundColor: AppColors.Peach,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
