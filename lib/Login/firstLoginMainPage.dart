import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xuberance2020/AnimatedBackground.dart';
import 'package:xuberance2020/Events/EventsPage.dart';
import 'package:xuberance2020/Login/PostLoginPage.dart';
import 'package:xuberance2020/values/colors.dart';

import '../AboutUs.dart';
import '../EventSchedule.dart';
import '../HomePage.dart';
import '../Sponsors.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
    );
  }
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String email = '', password = '', error = '';
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
    double height = displayHeight(context) * 0.1;

    return Scaffold(

      body: Stack(
        children: <Widget>[
          AnimatedBackground(),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
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
                                    'School Profile',
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

          Positioned(
            top: displayHeight(context) * 0.182,
            left: displayWidth(context) * 0.125,
            child: Center(
              child: Container(
                height: displayHeight(context) * 0.6,
                width: displayWidth(context) * 0.75,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Center(
                        child: Column(
                          children: <Widget>[
//                            Text("Login" , style: TextStyle(fontFamily: 'atmosphere', fontSize: 40.0),),
                            Container(width:displayHeight(context)*0.2,child: Image.asset("assets/images/bird.png")),
                            //SizedBox(height: 20.0),
                            Align(alignment: Alignment.centerLeft,child: Text("Username")),

                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.Blue)
                              ),
                              child: TextFormField(

                                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                              ),
                            ),
                           SizedBox(height: 10.0),
                            Align(alignment: Alignment.centerLeft,child: Text("Password")),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.Blue)
                              ),
                              child: TextFormField(

                                obscureText: true,
                                validator: (val) =>
                                val.length < 6 ? 'Enter a password 6+ chars long' : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                              ),
                            ),
                            Align(alignment: Alignment.centerRight,child: Text("Forgot Password?")),
                            SizedBox(height: 10.0),

                            Align(
                              alignment: Alignment.centerRight,
                              child: ClipOval(
                                child: RaisedButton(
color: AppColors.Blue,                              child: Text(
                                      'Sign In',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () async {
                                      dynamic result = await _auth
                                          .signInWithEmailAndPassword(
                                          email: email, password: password)
                                          .then((firebaseUser) => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PostLoginPage(email: email,))
                                      )
                                      .catchError((onError){
                                        setState(() {
                                          error = onError;
                                        });
                                      }));
                                      if (result == null) {
                                        setState(() {
                                          error = 'Could not sign in with those credentials';
                                        });
                                      }
                                    }),
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: AppColors.Peach,

                ),
              ),
            ),
          ),
          Positioned(
            right:60,
            left:60,
            top: displayHeight(context) * 0.78,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.center,                 child: Align(
                alignment: Alignment.center,
                child: Align(
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Or',
                      maxLines: 1,
                      style: TextStyle(
                          fontFamily: 'atmosphere',
                          fontSize:
                          (displayWidth(context) +
                              30 -
                              80) /
                              (15),
                          color:
                      Colors.black,),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              ),
            ),
          ),

          Positioned(
            right:50,
            left:50,
            top: displayHeight(context) * 0.86,
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AboutUs()));                                 // ...

              },
              child: Container(
                width: displayWidth(context) + 30,
                height: displayHeight(context) * 0.08,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.center,                 child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width:
                        displayWidth(context) + 30 - 80,
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Login As Guest',
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: 'atmosphere',
                                  fontSize:
                                  (displayWidth(context) +
                                      30 -
                                      80) /
                                      (15),
                                  color:
                                  AppColors.Blue                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.Peach,

                ),
              ),
            ),
          ) ,
        ],
      ),
    );
  }
}
