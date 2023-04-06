import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GoogleFontsPackageExample();
  }
}

class GoogleFontsPackageExample extends StatelessWidget {
  const GoogleFontsPackageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme().copyWith(),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Google Fonts Package Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "bitter",
                style: GoogleFonts.bitter(
                  color: Colors.blue,
                  fontSize: 30,
                ),
              ),
              Text(
                "rubikDirt",
                style: GoogleFonts.rubikDirt(
                  color: Colors.blue,
                  fontSize: 30,
                ),
              ),
              const Text(
                "Default montserrat",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
