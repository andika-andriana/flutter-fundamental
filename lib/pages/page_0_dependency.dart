import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page0Dependency extends StatelessWidget {
  const Page0Dependency({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 0 Dependency"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // shorthand navigator push
                Get.toNamed("/page1");
              },
              child: const Text("Next Page"),
            ),
          ],
        ),
      ),
    );
  }
}
