import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const TimerExample();
  }
}

class TimerExample extends StatefulWidget {
  const TimerExample({super.key});

  @override
  State<TimerExample> createState() => _TimerExampleState();
}

class _TimerExampleState extends State<TimerExample> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                counter.toString(),
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: isBlack ? Colors.black : Colors.amber,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                child: const Text("Realtime Run"),
                onPressed: () {
                  Timer.run(() {
                    setState(() {
                      isBlack = !isBlack;
                    });
                  });
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                child: const Text("Delay Run"),
                onPressed: () {
                  Timer(const Duration(seconds: 5), () {
                    setState(() {
                      isBlack = !isBlack;
                    });
                  });
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                child: const Text("Start Timer"),
                onPressed: () {
                  isStop = false;
                  counter = 0;
                  Timer.periodic(const Duration(milliseconds: 1), (timer) {
                    if (isStop) {
                      timer.cancel();
                    } else {
                      setState(() {
                        counter++;
                      });
                    }
                  });
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                child: const Text("Stop Timer"),
                onPressed: () {
                  setState(() {
                    isStop = true;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
