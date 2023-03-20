import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Second Page",
          style: TextStyle(fontFamily: "Poppins"),
        ),
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text(
          "Back",
          style: TextStyle(fontFamily: "Poppins"),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      )),
    );
  }
}
