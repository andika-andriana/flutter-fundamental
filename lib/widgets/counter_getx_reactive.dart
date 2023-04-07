import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/getx/counter_reactive.dart';

class CounterGetXReactive extends StatelessWidget {
  const CounterGetXReactive({super.key});

  @override
  Widget build(BuildContext context) {
    final counterController = Get.put(CounterControllerReactive());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() {
          return Text(
            counterController.count.value.toString(),
            style: const TextStyle(
              fontSize: 100,
            ),
          );
        }),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                if (counterController.count.value <= 0) {
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
                Get.defaultDialog(
                  title: "Ketentuan Nilai",
                  middleText:
                      "Nilai tidak boleh kurang dari 0 dan lebih dari 5",
                );
              },
              child: const Text("Info"),
            ),
            ElevatedButton(
              onPressed: () {
                if (counterController.count.value >= 5) {
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
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Get.bottomSheet(Container(
              height: 300,
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    subtitle: const Text("Setting aplikasi disini"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Accounts"),
                    subtitle: const Text("Account aplikasi disini"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Logout"),
                    subtitle: const Text("Logout aplikasi disini"),
                    onTap: () {},
                  )
                ],
              ),
            ));
          },
          child: const Text("Show Menu"),
        ),
      ],
    );
  }
}
