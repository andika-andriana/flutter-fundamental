import 'package:flutter/material.dart';
import 'package:flutter_application_1/second_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Main Page",
          style: TextStyle(fontFamily: "Poppins"),
        ),
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text(
          "Go to second page",
          style: TextStyle(fontFamily: "Poppins"),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const SecondPage();
          }));
        },
      )),
    );
  }
}
