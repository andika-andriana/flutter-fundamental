import 'package:flutter/material.dart';
import 'package:flutter_application_1/application_color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SingleProviderStateManagement(),
    );
  }
}

class SingleProviderStateManagement extends StatelessWidget {
  const SingleProviderStateManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ApplicationColor>(
        create: (context) => ApplicationColor(),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black45,
              title: Consumer<ApplicationColor>(
                builder: (context, value, child) {
                  return Text(
                    "Single Provider State Management",
                    style: TextStyle(color: value.color),
                  );
                },
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ApplicationColor>(
                    builder: (context, value, child) {
                      return Container(
                        width: 200,
                        height: 200,
                        color: value.color,
                        margin: const EdgeInsets.only(bottom: 10),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Amber"),
                      Consumer<ApplicationColor>(
                        builder: (context, value, child) {
                          return Switch(
                              value: value.isLightBlue,
                              onChanged: (switchVal) {
                                value.isLightBlue = switchVal;
                              });
                        },
                      ),
                      const Text("Light Blue"),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
