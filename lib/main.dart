import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimatedSwitcherExample(),
    );
  }
}

class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({super.key});

  @override
  State<AnimatedSwitcherExample> createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  bool isActive = false;
  Widget animatedWidget = Container(
    key: const Key('animatedWidget default'),
    height: 150,
    width: 300,
    color: Colors.grey[300],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Switcher Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedSwitcher(
                duration: const Duration(
                  seconds: 1,
                ),
                child: animatedWidget,

                // if need custom animation
                // transitionBuilder: (child, animation) {
                // scale
                /*
                  return ScaleTransition(
                    scale: animation,
                    child: animatedWidget,
                  );
                  */

                // rotate
                /*
                  return RotationTransition(
                    turns: animation,
                    child: animatedWidget,
                  );
                  */
                // },
              ),
              Switch(
                value: isActive,
                onChanged: (value) {
                  isActive = value;
                  setState(() {
                    if (isActive == false) {
                      animatedWidget = Container(
                        key: const Key('animatedWidget false'),
                        height: 150,
                        width: 300,
                        color: Colors.grey[300],
                      );
                    } else {
                      animatedWidget = Container(
                        key: const Key('animatedWidget true'),
                        height: 150,
                        width: 300,
                        color: Colors.blue[300],
                      );
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
