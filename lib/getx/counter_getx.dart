import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;

  increment() => count += 1;
  decrement() => count -= 1;
}
