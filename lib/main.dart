import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/getx/page_dependency.dart';
import 'package:flutter_application_1/pages/page_0_dependency.dart';
import 'package:flutter_application_1/pages/page_1_dependency.dart';
import 'package:flutter_application_1/pages/page_2_dependency.dart';
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
      // routes: {
      //   "/": (context) => const Page0Dependency(),
      //   "/page1": (context) => const Page1Dependency(),
      //   "/page2": (context) => Page2Dependency(),
      // },
      getPages: [
        GetPage(name: "/", page: () => const Page0Dependency()),
        GetPage(
          name: "/page1",
          page: () => const Page1Dependency(),
          // binding: BindingsBuilder.put(() => PageDependency()),
          bindings: [
            BindingsBuilder.put(() => PageDependency()),
            // BindingsBuilder.put(() => Page1Dependency()),
            // BindingsBuilder.put(() => Page2Dependency()),
          ],
        ),
        GetPage(name: "/page2", page: () => Page2Dependency()),
      ],
    );
  }
}
