
import 'package:flutter/material.dart';

class TeamsWidget extends StatelessWidget {
  double getWidth(BuildContext context) =>  MediaQuery.of(context).size.width;
  double getHeight(BuildContext context) =>  MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {

    return Padding(
          padding: const EdgeInsets.only(top:16.0, bottom: 16.0),
      child: Container(
 width: (getWidth(context) -16) / 2.0,
        height: (getWidth(context) -16) / 2.0,
        child: Center(child: Stack(
          children: <Widget>[
            Center(child: FittedBox(fit: BoxFit.fill,child: Image.asset('assets/images/teams.jpg'))),
            RotatedBox(
              quarterTurns: 1,
              child:   Container(

                decoration: BoxDecoration(

                  gradient: LinearGradient(colors: <Color>[Colors.transparent, Colors.white]),

                ),

              ),
            ),
            Positioned(
              bottom: 0,      right:0,left:0,      child: Column(
              children: <Widget>[
                Text("NAME"),
                Text("post"),
              ],
            ),
            )
          ],
        ),),

      ),
    );
  }
}
