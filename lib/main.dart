import 'package:flutter/material.dart';
import 'package:flutter_application_1/mobx/counter_mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobXStateManagementExample();
  }
}

CounterMobx counterMobx = CounterMobx();

class MobXStateManagementExample extends StatelessWidget {
  const MobXStateManagementExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Mobx State Management Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(
                builder: (context) => Text(
                  counterMobx.value.toString(),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () => counterMobx.decrement(),
                    child: const Icon(Icons.arrow_downward),
                  ),
                  const SizedBox(width: 20),
                  FloatingActionButton(
                    onPressed: () => counterMobx.increment(),
                    child: const Icon(Icons.arrow_upward),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
