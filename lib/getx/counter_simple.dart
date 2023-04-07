import 'package:get/get.dart';

class CounterControllerSimple extends GetxController {
  int count = 0;

  increment() => count += 1;
  decrement() => count -= 1;

  updateValue() => update();
}
