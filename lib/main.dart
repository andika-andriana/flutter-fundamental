import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomHeightAppBar(),
    );
  }
}

class CustomHeightAppBar extends StatelessWidget {
  const CustomHeightAppBar({super.key});
  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getHeight(context) * 0.3),
        child: AppBar(
          backgroundColor: Colors.black26,
          flexibleSpace: Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  "Custom Height AppBar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: "Poppins",
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
