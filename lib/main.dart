import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ExtentionsExample();
  }
}

class ExtentionsExample extends StatelessWidget {
  ExtentionsExample({super.key});

  final int bilangan = -5;
  final List list = [0, 1, 2, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Extention Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bilangan" & bilangan.negate().toString(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Angka Tengah" & list.getMidleValue().toString(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension NumberExtention<T extends num> on num {
  num negate() => -1 * this;
}

extension OperatorExtention<T extends String> on String {
  String operator &(String rightHand) => "$this: $rightHand";
}

extension ListExtentions<T extends List> on List {
  num getMidleValue() {
    if (isEmpty) {
      return 0;
    } else {
      return this[(length / 2).floor()];
    }
  }
}
