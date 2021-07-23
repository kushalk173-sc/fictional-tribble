
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xuberance2020/AnimatedBackground.dart';
import 'package:xuberance2020/Teams/TeamsMainWIdget.dart';

class TeamsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TeamsHomeList(),);
  }
}
class TeamsHomeList extends StatefulWidget {
  @override
  _TeamsHomeListState createState() => _TeamsHomeListState();
}

class _TeamsHomeListState extends State<TeamsHomeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedBackground(),
          Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new  Container(
                height: 300,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new TeamsWidget();
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemHeight: 100.0,
                  viewportFraction: 0.51,
                  scale: 1,
                ),
              );
            },
            itemCount: 10,
            viewportFraction: 0.6,
            scale: 0.8,
          ),

        ],
      ),
    );
  }
}

