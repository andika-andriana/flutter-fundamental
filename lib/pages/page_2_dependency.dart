import 'package:flutter/material.dart';
import 'package:flutter_application_1/getx/page_dependency.dart';
import 'package:flutter_application_1/pages/page_1_dependency.dart';
import 'package:get/get.dart';

class Page2Dependency extends StatelessWidget {
  Page2Dependency({super.key});
  //
  // find controller has been put before;
  final PageDependency pageDependency = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // shorthand navigator pop to
                Get.off(Page1Dependency());
              },
              child: const Text("Pop to Page 1"),
            ),
            ElevatedButton(
              onPressed: () {
                // shorthand navigator pop to top
                Get.offAll(Page1Dependency());
              },
              child: const Text("Pop to Top Page 1"),
            ),
            ElevatedButton(
              onPressed: () {
                // shorthand navigator pop
                Get.back();
              },
              child: const Text("Prev Page"),
            ),
          ],
        ),
      ),
    );
  }
}