import 'dart:math';
import 'package:flutter/material.dart';
import 'package:division/division.dart';

class CustomButtonDivision extends StatefulWidget {
  final Color mainColor, secondColor;
  final String buttonText;
  const CustomButtonDivision({
    super.key,
    required this.mainColor,
    required this.secondColor,
    required this.buttonText,
  });

  @override
  State<CustomButtonDivision> createState() => _CustomButtonDivisionState();
}

class _CustomButtonDivisionState extends State<CustomButtonDivision> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle(
        angleFormat: AngleFormat.radians,
      )
        ..borderRadius(all: 15)
        ..elevation((isPressed) ? 2 : 10, color: Colors.black)
        ..rotate((isPressed) ? pi / 4 : 0.0),
      gesture: Gestures()
        ..onTapDown(
          (details) {
            setState(() {
              isPressed = !isPressed;
            });
          },
        )
        ..onTapUp(
          (details) {
            setState(
              () {
                isPressed = !isPressed;
              },
            );
          },
        )
        ..onTapCancel(
          () {
            setState(
              () {
                isPressed = !isPressed;
              },
            );
          },
        ),
      child: Parent(
        style: ParentStyle(angleFormat: AngleFormat.radians)
          ..padding(all: 16)
          ..borderRadius(all: 15)
          ..background
              .color((isPressed) ? widget.secondColor : widget.mainColor),
        child: Txt(
          widget.buttonText,
          style: TxtStyle()
            ..fontFamily("Poppins")
            ..fontSize(24)
            ..textColor(Colors.white)
            ..fontWeight(FontWeight.w600),
        ),
      ),
    );
  }
}
