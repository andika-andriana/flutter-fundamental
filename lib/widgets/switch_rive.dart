import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SwicthRive extends StatefulWidget {
  const SwicthRive({super.key});

  @override
  State<SwicthRive> createState() => _SwicthRiveState();
}

class _SwicthRiveState extends State<SwicthRive> {
  /// 0 = night
  ///
  /// 1 = night -> day
  ///
  /// 2 = day
  ///
  /// 3 = day -> night
  int animationState = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (animationState == 0) {
          setState(() {
            animationState = 1;
          });
        } else if (animationState == 2) {
          setState(() {
            animationState = 3;
          });
        }
      },
      child: FlareActor(
        "assets/switch_daytime.flr",
        animation: (animationState == 0)
            ? "night_idle"
            : (animationState == 1)
                ? "switch_day"
                : (animationState == 2)
                    ? "day"
                    : "switch_night",
        callback: (animationName) {
          if (animationName == "switch_day") {
            setState(() {
              animationState = 2;
            });
          } else if (animationName == "switch_night") {
            setState(() {
              animationState = 0;
            });
          }
        },
      ),
    );
  }
}
