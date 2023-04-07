import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/getx/counter_getx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
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
      home: const GetXIntroExample(),
    );
  }
}

class GetXIntroExample extends StatelessWidget {
  const GetXIntroExample({super.key});

  @override
  Widget build(BuildContext context) {
    final counterController = Get.put(CounterController());
    // ignore: avoid_print
    print("Check Parent Re-Render");
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Get X Intro Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                // ignore: avoid_print
                print("Check Observer Re-Render");
                return Text(
                  counterController.count.value.toString(),
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                );
              }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => counterController.increment(),
                    child: const Icon(Icons.remove),
                  ),
                  ElevatedButton(
                    onPressed: () => counterController.increment(),
                    child: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
