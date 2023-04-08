import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/getx/counter_workers.dart';

class CounterGetXWorkers extends StatelessWidget {
  const CounterGetXWorkers({super.key});

  @override
  Widget build(BuildContext context) {
    final counterController = Get.put(CounterControllerWorkers());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => Text(
            counterController.count.value.toString(),
            style: const TextStyle(
              fontSize: 100,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                if (counterController.count <= 0) {
                  Get.snackbar(
                    "Minimum 0",
                    "Counter tidak boleh kurang dari 0",
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(milliseconds: 1000),
                  );
                } else {
                  counterController.decrement();
                  counterController.onChange();
                }
              },
              child: const Icon(Icons.remove),
            ),
            Obx(
              () => Text(
                "Change ${counterController.changes.value} Times",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (counterController.count >= 100) {
                  Get.snackbar(
                    "Maximum 100",
                    "Counter tidak boleh lebih dari 100",
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(milliseconds: 1000),
                  );
                } else {
                  counterController.increment();
                  counterController.onChange();
                }
              },
              child: const Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }
}
