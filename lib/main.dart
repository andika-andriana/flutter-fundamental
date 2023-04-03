import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccessibilityExample();
  }
}

class AccessibilityExample extends StatefulWidget {
  const AccessibilityExample({super.key});

  @override
  State<AccessibilityExample> createState() => _AccessibilityExampleState();
}

class _AccessibilityExampleState extends State<AccessibilityExample> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Semantics(
            hidden: true,
            excludeSemantics: true,
            child: const Text("Accessibility Example"),
          ),
        ),
        body: Center(
          child: Semantics(
            label:
                "Ini adalah bilangan yang akan ditambahkan, Nilai saat ini adalah: ",
            child: Text(
              number.toString(),
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 80,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              number++;
            });
          },
          child: Semantics(
            onTapHint: "Untuk menambah bilangan dengan 1",
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
