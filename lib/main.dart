import 'package:flutter/material.dart';
import 'package:flutter_application_1/bindings/page_binding.dart';
import 'package:flutter_application_1/pages/page_0_dependency.dart';
import 'package:flutter_application_1/pages/page_1_dependency.dart';
import 'package:flutter_application_1/pages/page_2_dependency.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await GetStorage.init();
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
      //
      // route can use binding getx feature
      //
      // routes: {
      //   "/": (context) => const Page0Dependency(),
      //   "/page1": (context) => const Page1Dependency(),
      //   "/page2": (context) => Page2Dependency(),
      // },
      //
      getPages: [
        GetPage(name: "/", page: () => const Page0Dependency()),
        GetPage(
          name: "/page1",
          page: () => Page1Dependency(),
          // binding with class binding getx
          binding: PageBinding(),
          //
          // bellow code without class bindings feature
          //
          // binding: BindingsBuilder.put(() => PageDependency()),
          // bindings: [
          //   BindingsBuilder.put(() => PageDependency()),
          //   // BindingsBuilder.put(() => Page1Dependency()),
          //   // BindingsBuilder.put(() => Page2Dependency()),
          // ],
        ),
        GetPage(name: "/page2", page: () => Page2Dependency()),
      ],
    );
  }
}
