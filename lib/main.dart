import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_button_division.dart';
import 'package:flutter_application_1/widgets/custom_button_wo_division.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const DivisionStylePackageExample();
  }
}

class DivisionStylePackageExample extends StatelessWidget {
  const DivisionStylePackageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Division Style Package Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // button without division style
              CustomButtonWoDivision(
                mainColor: Colors.blue,
                secondColor: Colors.red,
                buttonText: "Division".toUpperCase(),
              ),

              // button with division style
              CustomButtonDivision(
                mainColor: Colors.blue,
                secondColor: Colors.green,
                buttonText: "Division".toUpperCase(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
