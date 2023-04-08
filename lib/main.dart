import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/pages/page_1_dependency.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      home: const GetXRouteManagementExample(),
    );
  }
}

class GetXRouteManagementExample extends StatelessWidget {
  const GetXRouteManagementExample({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Get X Route Management Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // get route shorthand push navigator
                  Get.to(Page1Dependency());
                },
                child: const Text("Next Page"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
