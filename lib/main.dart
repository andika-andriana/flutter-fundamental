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
      home: ImageGradientOpacityExample(),
    );
  }
}

class ImageGradientOpacityExample extends StatelessWidget {
  const ImageGradientOpacityExample({super.key});
  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Image Gradient Opacity Example"),
        ),
        body: Center(
          child: ShaderMask(
            shaderCallback: (rectangle) {
              return const LinearGradient(
                colors: [Colors.white, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(
                Rect.fromLTRB(0, 0, rectangle.width, rectangle.height),
              );
            },
            child: Image(
              width: getWidth(context) * 0.8,
              image: const NetworkImage(
                  'https://picsum.photos/seed/picsum/500/500'),
            ),
          ),
        ),
      ),
    );
  }
}
