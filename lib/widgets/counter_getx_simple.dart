import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/getx/counter_simple.dart';

class CounterGetXSimple extends StatelessWidget {
  const CounterGetXSimple({super.key});

  @override
  Widget build(BuildContext context) {
    final counterController = Get.put(CounterControllerSimple());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetBuilder<CounterControllerSimple>(
          builder: (controller) => Text(
            controller.count.toString(),
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
                }
              },
              child: const Icon(Icons.remove),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Colors.green,
                ),
              ),
              onPressed: () {
                counterController.updateValue();
              },
              child: const Text("Refresh"),
            ),
            ElevatedButton(
              onPressed: () {
                if (counterController.count >= 5) {
                  Get.snackbar(
                    "Maximum 5",
                    "Counter tidak boleh lebih dari 5",
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(milliseconds: 1000),
                  );
                } else {
                  counterController.increment();
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
