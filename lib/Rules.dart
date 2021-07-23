import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'AnimatedBackground.dart';

import 'EventSchedule.dart';
import 'Events/EventDetails.dart';
import 'Events/EventListItem.dart';
import 'Events/EventsPage.dart';
import 'Login/firstLoginMainPage.dart';
import 'AboutUs.dart';
import 'HomePage.dart';
import 'Sponsors.dart';
import 'values/colors.dart';

class Rules extends StatelessWidget {
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
          .where("type", isEqualTo: "Recorded")
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
          .where("type", isEqualTo: "Recorded")
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

  String live =
      "Participants of these events perform live in front of the judges, in a Zoom meeting. These meetings shall have no audience.\n\n A link to the Zoom Meeting and the Invitation to the WhatsApp group for each respective event shall be sent to the School Representatives at least a day prior to the event.\n Participants in these events are advised to have a strong internet connection to ensure a smooth participation in the event.\n Participants are requested to remain muted at all times unless they are asked to speak. One shall be muted or unmuted, as per the requirements of the event. Participants are expected to keep their cameras on at all times during the event.\n Participants are expected to keep their cameras on at all times during the event.\n All participants are required to rename themselves before they enter the events as “SCHOOLINITIALS_ParticipantName”(eg.- SXCS_DonaldTrump)\n All Participants are required to have their school logo as their Zoom profile picture.\n The participants are requested to enter the meeting 10 minutes before the scheduled time, after which it will be locked.\nParticipants and respective schools shall be held responsible for any connection issues during the meeting.</b>";
String broadcast = " Schools are required to make video performances of the respective recorded events.\n\n The video performance submitted should be the final version, on which judgement will be based. The link to submit the video shall be provided in the X-Uberance app. The last date of submission is the 14th of October.\n Each Broadcast Event shall have a WhatsApp group comprising of all participants after the registrations. All necessary communications regarding that event shall be done in the group itself.\n The video size should not exceed <b>500mb</b>. <b>MP4</b> is the only video format that will be accepted. These videos will be viewed by the judges in a Zoom Webinar. The link shall be provided and the participants are to be present in this webinar. This event will also be open to audiences, who can access the link from our Instagram page.\n A video of the entire event shall be uploaded on YouTube after the fest for future viewing.\n <b>Keeping in mind the current situation and the social distancing regulations, all individual participants should record their parts individually, and then edit it into a performance.";
 //String entry = "Participants of these events will have to upload their entries onto the X-Uberance Google Drive by the specified date. Specific rules and guidelines for each event have also been provided in the Representatives\’ Profile and will be further discussed in their respective WhatsApp groups.\n\n Each Entry-Based Event shall have a WhatsApp group (Except X-MEME and X-BET) comprising of all participants after the registrations. All necessary communications regarding that event shall be done in the group itself .\n&#8226;The last date of submission is the <b> 14th of October </b>.\n For X-CLICK, X-FLIP and X-SPLASH, the topic/theme will be given and participants will have limited time to finish their project and submit it to the event heads.\n;For X-MEME, X-60 and X-BET, specific details regarding procedure and submission will be explained in the reps meet.\n;
 String entry = "Participants of these events will have to upload their entries onto the X-Uberance Google Drive by the specified date. Specific rules and guidelines for each event have also been provided in the Representatives\’ Profile and will be further discussed in their respective WhatsApp groups.\n\n Each Entry-Based Event shall have a WhatsApp group (Except X-MEME and X-BET) comprising of all participants after the registrations. All necessary communications regarding that event shall be done in the group itself .\n&#8226;The last date of submission is the <b> 14th of October </b>.\n For X-CLICK, X-FLIP and X-SPLASH, the topic/theme will be given and participants will have limited time to finish their project and submit it to the event heads.\n&#8226;For X-MEME, X-60 and X-BET, specific details regarding procedure and submission will be explained in the reps meet.\n";
String group = "The two events falling under this bracket, X-Negotium and X-Periment, are of 4 events each.\n&#8226;Each Group Event shall have a WhatsApp group comprising of all Participants after the registrations. All necessary communications regarding that event shall be done in the group itself.\n&#8226;The grouped events can be considered to be a single event comprising 4 rounds, in which a single participant or participant group must take part in each round of the event.\n&#8226;Every round in a group event is an <b> elimination </b> round, and a person needs to pass each event for the team to continue to the next event.\n&#8226;The group of the participant or participant winning the last round shall become the Best Negotiator or the Best Scientists.\n";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appBar: AppBar(backgroundColor: Colors.transparent,),
      body: Stack(
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
                                        "Live",
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
                                              live,
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
                                        "Broadcast ",
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
                                              broadcast,
                                              minFontSize: 16,
                                              maxFontSize: 16,
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
                                        "Entry- Based",
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
                                              entry,
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
                                        "Group",
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
                                              group,
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
    );
  }
}
