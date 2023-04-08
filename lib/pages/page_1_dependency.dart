import 'package:flutter/material.dart';
import 'package:flutter_application_1/getx/page_dependency.dart';
import 'package:get/get.dart';

class Page1Dependency extends StatelessWidget {
  Page1Dependency({super.key});
  //
  // use put for init dependency
  final pageDependency = Get.put(PageDependency());
  // or lazyput, this will init after Get.find called on another screen
  //  final pageDependency = Get.lazyPut(()=>PageDependency());
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Page 1 Dependency"),
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
                // shorthand navigator push
                Get.toNamed("/page2");
              },
              child: const Text("Next Page"),
            ),
          ],
        ),
      ),
    );
  }
}
