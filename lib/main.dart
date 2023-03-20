import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimatedPaddingExample(),
    );
  }
}

class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({super.key});

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  double animatePaddingValue = 4;

  void tooglePadding() {
    setState(() {
      if (animatePaddingValue == 4) {
        animatePaddingValue = 8;
      } else {
        animatePaddingValue = 4;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Padding Example'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.all(animatePaddingValue),
                        child: GestureDetector(
                          onTap: tooglePadding,
                          child: Container(
                            color: Colors.blue[200],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.all(animatePaddingValue),
                        child: GestureDetector(
                          onTap: tooglePadding,
                          child: Container(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.all(animatePaddingValue),
                        child: GestureDetector(
                          onTap: tooglePadding,
                          child: Container(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.all(animatePaddingValue),
                        child: GestureDetector(
                          onTap: tooglePadding,
                          child: Container(
                            color: Colors.blue[200],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
