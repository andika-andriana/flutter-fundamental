import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ColorfulButtonView(),
    );
  }
}

class ColorfulButtonView extends StatelessWidget {
  const ColorfulButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom Button Transform"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ColorfulButton(
                mainColor: Colors.red,
                secondColor: Colors.grey,
                iconData: Icons.home,
              ),
              ColorfulButton(
                mainColor: Colors.green,
                secondColor: Colors.grey,
                iconData: Icons.book,
              ),
              ColorfulButton(
                mainColor: Colors.purple,
                secondColor: Colors.grey,
                iconData: Icons.shop,
              ),
              ColorfulButton(
                mainColor: Colors.blue,
                secondColor: Colors.grey,
                iconData: Icons.person,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorfulButton extends StatefulWidget {
  final Color mainColor, secondColor;
  final IconData iconData;
  const ColorfulButton({
    super.key,
    required this.mainColor,
    required this.secondColor,
    required this.iconData,
  });

  @override
  State<ColorfulButton> createState() => _ColorfulButtonState();
}

class _ColorfulButtonState extends State<ColorfulButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: (isPressed) ? pi / 4 : 0.0,
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            isPressed = !isPressed;
          });
        },
        onTapUp: (details) {
          setState(() {
            isPressed = !isPressed;
          });
        },
        onTapCancel: () {
          setState(() {
            isPressed = !isPressed;
          });
        },
        child: Material(
          borderRadius: BorderRadius.circular(15),
          elevation: (isPressed) ? 2 : 10,
          shadowColor: (isPressed) ? widget.secondColor : widget.mainColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: SizedBox(
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      color:
                          (isPressed) ? widget.secondColor : widget.mainColor,
                      child: Transform.rotate(
                        angle: (isPressed) ? -pi / 4 : 0.0,
                        child: Icon(
                          widget.iconData,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(30, 30),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SizedBox(
                      child: Material(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(30, -30),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SizedBox(
                      child: Material(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-30, -30),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SizedBox(
                      child: Material(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-30, 30),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SizedBox(
                      child: Material(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
