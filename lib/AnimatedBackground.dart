import 'package:flutter/cupertino.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(Duration(seconds: 1),
          ColorTween(begin: Color(0xffEBB99E), end: Color(0xff3B6272))),
      Track("color2").add(Duration(seconds: 1),
          ColorTween(begin: Color(0xff3B6272), end:Color(0xffEBB99E)))
    ]);


    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}