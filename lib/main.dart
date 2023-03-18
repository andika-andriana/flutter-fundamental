import 'package:flutter/material.dart';
import 'package:flutter_application_1/get_result_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GetFromApiExample(),
    );
  }
}

class GetFromApiExample extends StatefulWidget {
  const GetFromApiExample({super.key});

  @override
  State<GetFromApiExample> createState() => _GetFromApiExampleState();
}

class _GetFromApiExampleState extends State<GetFromApiExample> {
  GetResult? getResult;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Get From Api Example'),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  (getResult != null)
                      ? ' id: ${getResult?.id}\n name: ${getResult?.name}\n'
                      : 'load me'.toUpperCase(),
                  style: const TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        GetResult.getFromApi('1').then((value) {
                          setState(() {
                            getResult = value;
                            isLoading = false;
                          });
                        });
                      },
                      child: Text(
                        isLoading ? 'Loading..' : 'Get'.toUpperCase(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isLoading = false;
                          getResult = null;
                        });
                      },
                      child: const Icon(
                        Icons.clear,
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
