import 'dart:math';

import 'package:flutter/material.dart';

class CustomButtonWoDivision extends StatefulWidget {
  final Color mainColor, secondColor;
  final String buttonText;
  const CustomButtonWoDivision({
    super.key,
    required this.mainColor,
    required this.secondColor,
    required this.buttonText,
  });

  @override
  State<CustomButtonWoDivision> createState() => _CustomButtonWoDivisionState();
}

class _CustomButtonWoDivisionState extends State<CustomButtonWoDivision> {
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
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: (isPressed) ? widget.secondColor : widget.mainColor,
            ),
            child: Text(
              widget.buttonText,
              style: const TextStyle(
                fontFamily: "Poppins",
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
