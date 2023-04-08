import 'package:flutter/material.dart';
import 'package:flutter_application_1/getx/page_dependency.dart';
import 'package:get/get.dart';

class Page2Dependency extends StatelessWidget {
  const Page2Dependency({super.key});

  @override
  Widget build(BuildContext context) {
    //
    // find controller has been put before;
    final PageDependency pageDependency = Get.find();
    //
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Page 2 Dependency"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Name: ${pageDependency.person1['name']}",
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                "Age: ${pageDependency.person1['age']}",
                style: const TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
