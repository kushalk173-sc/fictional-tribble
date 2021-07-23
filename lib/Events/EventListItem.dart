import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xuberance2020/values/colors.dart';

class EventListItem extends StatelessWidget {
 final  bool left ;
final String name;
final int day;
final String url;
final GestureTapCallback onTap;
//final String ShortDescription;
  const EventListItem({Key key, this.left, this.name, this.day, this.onTap, this.url}) : super(key: key);
  double getWidth(BuildContext context) =>  MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    int qday = day + 8;
    double wicth = (getWidth(context) -16) / 2.0;
    Color text =  left ? Colors.white: Colors.black;
  return Expanded(
    child: GestureDetector(
        onTap: onTap ,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: wicth,
            height: wicth,
            child: Stack(
children: <Widget>[
 // Opacity(opacity:0,child: FittedBox(fit: BoxFit.fill,child: Center(child: Hero(tag:name + '*',child: Image.asset('assets/images/xdance.jpg'))))),
    Opacity(
          opacity: 0.65,
          child: Container(
            color: left ? AppColors.Blue: AppColors.Peach,
          ),

    ),
    Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Hero(tag:name,child: AutoSizeText("$name", maxLines:2,style: TextStyle(fontFamily: 'atmosphere' , color: text, fontSize: wicth / name.length + 8),)),
      ),
      Center(
                child: Hero(tag:name+'d',child: Text("/Dance/" , style: TextStyle(color: text, fontSize: wicth /(12)  ),)),
              ), Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText("$qdayᵗʰ October ",maxLines: 1,textAlign: TextAlign.center, style: TextStyle(color: text, fontSize: wicth/2  ),),
              ),


            ],
          ),
    ),
            Hero(
              tag: name + '*',
              child: Image.network(
url            ),
            ),
],
            ),
          ),
        ),
      ),
  );

  }
}
