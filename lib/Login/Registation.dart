import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../values/colors.dart';

class Registrations extends StatelessWidget {
  final String code;

  const Registrations({Key key, this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Register(
        SchoolCode: code,
      ),
    );
  }
}

class Register extends StatefulWidget {
  final String SchoolCode;

  const Register({Key key, this.SchoolCode}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState(code: SchoolCode);
}

class _RegisterState extends State<Register> {
  final String code;
  var firestore = Firestore.instance;
  PageController controller;
Future state ;
  Future getEvents() async {
    QuerySnapshot querySnapshot;
    querySnapshot = await firestore.collection('event_schedule').where("numberPart", isGreaterThan: 0).getDocuments();
    return querySnapshot.documents;
  }
  @protected
  @mustCallSuper
  void initState() {
state = getEvents();  }
  Size displaySize(BuildContext context) {
    ////  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }
  Future _ackAlert(BuildContext context, AsyncSnapshot snapshot, int max, int position, List _controllersPhone , List _controllersName) {

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Re-Check'),
          content: const Text('Please Check if You Have Given The Correct Details. This cannot be changed later on.'),
          actions: [
            FlatButton(
              child: Text('Go Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Confirm"),
              onPressed: (){

                  firestore
                      .collection('schools')
                      .document(code)
                      .collection(
                      'registration')
                      .document(snapshot
                      .data[position]
                      .data['name']).collection('participants').getDocuments().then((snapshot) {
                    for (DocumentSnapshot ds in snapshot.documents){
                      ds.reference.delete();
                    }

//                    for (QueryDocumentSnapshot document : task.getResult()) {
//                    db.collection("users").document(userID).
//                    collection("cart").document(document.getId()).delete();
//                    }
                  });
                  int a = 0;
                  while (a < max) {
                    firestore
                        .collection('schools')
                        .document(code)
                        .collection(
                        'regestration')
                        .document(snapshot
                        .data[position]
                        .data['name'])
                        .collection(
                        'participants')
                        .add({
                      'name':
                      _controllersName[a]
                          .text,
                      'phone':
                      _controllersPhone[a]
                          .text,
                    });
                    _controllersPhone[a]
                        .clear();
                    _controllersName[a]
                        .clear();

                    a++;

                  }

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

  _RegisterState({this.code});

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
                                      width:
                                      displayWidth(context) + 30 - 80,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text(
                                            'Registrations',
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontFamily: 'atmosphere',
                                                fontSize:
                                                (displayWidth(context) +
                                                    30 -
                                                    80) /
                                                    (15),
                                                color:
                                                Colors.black                                  ),
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
                  PageView.builder(
                      controller: controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, position) {
                        int max = snapshot.data[position].data['numberPart'];
                        List<TextEditingController> _controllersPhone = new List();
                        List<TextEditingController> _controllersName = new List();


                          return Stack(
                          children: <Widget>[
                            Positioned(
                              right: displayWidth(context) * 0.5 - 175,
                              //left: displayWidth(context) * 0.35,
                              top: displayHeight(context) * 0.2,
                              child: Center(
                                  child: Container(
                                    width: 350.0,
                                    child:
                                    Center(
                                      child: Text(snapshot.data[position].data['name'],style:TextStyle(
                                          fontFamily: 'atmosphere',
                                          color: Colors.white,
                                          fontSize: 24.0

                                      ),),
                                    ),
                                  )),
                            ),
                            Positioned(
                              right: displayWidth(context) * 0.125,
                              top: displayHeight(context) * 0.25,
                              child: Center(
                                child: Container(
                                  height: displayHeight(context) * 0.6,
                                  width: displayWidth(context) * 0.75,
                                  child: Center(
                                    child: ListView.builder(
                                        itemCount: max + 1,
                                        itemBuilder: (context, index) {
                                          _controllersPhone
                                              .add(new TextEditingController());
                                          _controllersName
                                              .add(new TextEditingController());

                                          String name1 = '', phone = '';
                                          //  if(index == 0 ){}
                                          if (index == max) {
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


                                                            _ackAlert(context , snapshot ,max,position,_controllersPhone, _controllersName);

                                                          },
                                                        )),
                                                  ),
                                                ));
                                          }
                                          int s = index+1;
                                          return Container(
                                            width:
                                            displayWidth(context) * 0.75 - 16,
                                            height: 70,
                                            child: Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Text("$s ." ,  ),
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                   // Text("Name"),
                                                    Container(
                                                      width:
                                                      (displayWidth(context) *
                                                          0.75 -
                                                          16) /
                                                          2 -
                                                          16 - 10  ,
                                                      height: 45.0,
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                        child: new TextField(
                                                          decoration: new InputDecoration(
                                                            border: new OutlineInputBorder(
                                                                borderSide: new BorderSide(color: Colors.teal)),
                                                            //hintText: 'Tell us about yourself',
                                                            // helperText: 'Keep it short, this is just a demo.',
                                                            labelText: 'Name',

                                                            //prefixText: ' ',
                                                            //  suffixText: 'USD',
                                                            //    suffixStyle: const TextStyle(color: Colors.green)
                                                          ), autofocus: true,

                                                          controller:
                                                          _controllersName[
                                                          index],
                                                          onChanged: (value) {
                                                            name1 = value;
                                                            //participants[q]= Participant(snapshot.data[position].data['name'],name1,phone);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    //Text("Number"),
                                                    SizedBox(height: 8.0,),
                                                    Container(
                                                      width:
                                                      (displayWidth(context) *
                                                          0.75 -
                                                          16) /
                                                          2 -
                                                          16 + 10,
                                                      height: 30.0,
                                                      child: new TextField(
                                                        decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide: new BorderSide(color: Colors.teal)),
                                                          //hintText: 'Tell us about yourself',
                                                          // helperText: 'Keep it short, this is just a demo.',
                                                          labelText: 'Number',

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
                                                          phone = value;
//                                    participants[q]= Participant(snapshot.data[position].data['name'],name1,phone);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                          //Your code here
                                        }),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35.0),
                                    color: AppColors.Peach,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );

                      }),
                ],
              );
          }
        },
      ),
    );
  }
}
