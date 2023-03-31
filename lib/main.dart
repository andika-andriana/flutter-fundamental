import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/carousel.dart';
import 'package:flutter_application_1/widgets/custom_button_division.dart';
import 'package:flutter_application_1/widgets/custom_button_wo_division.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const WidgetSliderExample();
  }
}

class WidgetSliderExample extends StatelessWidget {
  const WidgetSliderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Widget Slider Example"),
          backgroundColor: Colors.black,
        ),
        body: SizedBox(
          height: 250,
          child: Carousel(),
        ),
      ),
    );
  }
}
