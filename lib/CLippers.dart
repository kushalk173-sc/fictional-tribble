import 'dart:ui';

import 'package:flutter/material.dart';

class LeftCLipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double factor = 0.8;
    Path path = new Path();
    path.lineTo(size.width * factor, 0);
    path.cubicTo(size.width*factor, 0, size.width*factor + size.height/1.75, size.height/2 , size.width*factor, size.height);
    //  path.quadraticBezierTo(size.width*factor + size.height, size.height/2 ,size.width*factor, size.height);
//path.arcTo(Rect.fromLTRB(size.width *0.9, 0, size.width *0.95, size.height), 0, 3.1415926535897932, true);
    path.lineTo(size.width*factor, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
class RightCLipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double factor = 0.8;
    Path path = new Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width - size.width * factor, 0);
    path.cubicTo(size.width - size.width*factor, 0,
        size.width - size.width*factor - size.height/1.75,
        size.height/2 ,
        size.width - size.width*factor,
        size.height);

    path.lineTo(size.width - size.width*factor, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}