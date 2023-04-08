import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_application_1/getx/page_dependency.dart';
// import 'package:flutter_application_1/pages/page_2_dependency.dart';

class Page1Dependency extends StatelessWidget {
  const Page1Dependency({super.key});
  //
  // use put for init dependency
  // final pageDependency = Get.put(PageDependency());
  // or lazyput, this will init after Get.find called on another screen
  //  final pageDependency = Get.lazyPut(()=>PageDependency());
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 1 Dependency"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // shorthand navigator push
                // Get.toNamed("/page2");

                // Single Binding Dependecy with to
                // Get.to(
                //   () => Page2Dependency(),
                //   binding: BindingsBuilder.put(
                //     () => PageDependency(),
                //   ),
                // );

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
