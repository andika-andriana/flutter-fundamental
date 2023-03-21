import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/timer_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomProgressBarExample();
  }
}

class CustomProgressBarExample extends StatefulWidget {
  const CustomProgressBarExample({super.key});

  @override
  State<CustomProgressBarExample> createState() =>
      _CustomProgressBarExampleState();
}

class _CustomProgressBarExampleState extends State<CustomProgressBarExample> {
  int counter = 0;
  bool isStop = false;
  bool isBlack = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Timer Example"),
        ),
        body: Center(
          child: ChangeNotifierProvider<TimerProvider>(
            create: (context) => TimerProvider(),
            child: Consumer<TimerProvider>(
              builder: (context, value, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomProgressBarView(
                    width: 300,
                    value: value.timer,
                    totalValue: 100,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (value.timer != 100) value.timer = 100;
                        },
                        child: Text(
                          "Reset Timer".toUpperCase(),
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          Timer.periodic(
                            const Duration(seconds: 1),
                            (timer) {
                              if (value.timer != 0) {
                                value.timer -= 10;
                              } else {
                                timer.cancel();
                              }
                            },
                          );
                        },
                        child: Text(
                          "Start Timer".toUpperCase(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomProgressBarView extends StatelessWidget {
  final double width;
  final int value, totalValue;

  const CustomProgressBarView({
    super.key,
    required this.width,
    required this.value,
    required this.totalValue,
  });

  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.timer,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 8),
        Stack(
          children: [
            Container(
              width: width,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(8),
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: width * ratio,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.lightGreen[600],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
