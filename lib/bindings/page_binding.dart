import 'package:flutter_application_1/getx/page_dependency.dart';
import 'package:get/get.dart';

class PageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PageDependency());
    // Get.lazyPut(() => Page1Dependency());
    // Get.lazyPut(() => Page2Dependency());
  }
}
