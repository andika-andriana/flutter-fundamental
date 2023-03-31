import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/carousel.dart';
import 'package:flutter_application_1/widgets/switch_rive.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const RiveFlutterExample();
  }
}

class RiveFlutterExample extends StatelessWidget {
  const RiveFlutterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Rife Flutter Example"),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: const SwicthRive(),
          ),
        ),
      ),
    );
  }
}
