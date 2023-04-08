// ignore_for_file: avoid_print

import 'package:get/get.dart';

class CounterControllerWorkers extends GetxController {
  var count = 0.obs;
  var changes = 0.obs;

  increment() => count += 1;
  decrement() => count -= 1;

  onChange() => changes++;

  @override
  void onInit() {
    // BELLOW WORKERS ONLY WORK INSIDE ON INIT METHOD
    ever(
      count, // listener
      (callback) => print(
        "EVER: Will trigger the callback every change of listener",
      ), // callback
    );
    once(
      count, // listener
      (callback) => print(
        "ONCE: Will trigger the callback once time after listener changed",
      ), // callback
    );
    debounce(
      count, // listener
      (callback) => print(
        "DEBOUNCE: Will trigger the callback every time after listener fully changed",
      ), // callback
      time: const Duration(
        seconds: 2,
      ), // will trigger every 2 second  after listener fully changed
    );
    interval(
      count, // listener
      (callback) => print(
        "INTERVAL: Will trigger the callback every time duration",
      ), // callback
      time: const Duration(
        seconds: 2,
      ), // will trigger every 2 second
    );
    super.onInit();
  }
}
