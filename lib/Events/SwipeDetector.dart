import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HomePage.dart';
import 'EventsPage.dart';

class gDec extends StatelessWidget {
  final Widget child;
final String page;
  const gDec({Key key, this.child, this.page}) : super(key: key);

  LeftSwipeAction(BuildContext context) {
    debugPrint("slided");
    if (page=='EventsHome')
    Navigator.push(
        context, PageRouteBuilder(                      transitionDuration: Duration(seconds: 2),
        pageBuilder: (_, __, ___) => EventsHomePage()),);
    else if(page=='MainHome')
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => XuberanceHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: child,
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            //  debugPrint("slided");
            LeftSwipeAction(context);
          }
        });
  }
}