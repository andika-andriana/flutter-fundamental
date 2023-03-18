import 'package:flutter/material.dart';
import 'package:flutter_application_1/get_list_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GetListFromApiExample(),
    );
  }
}

class GetListFromApiExample extends StatefulWidget {
  const GetListFromApiExample({super.key});

  @override
  State<GetListFromApiExample> createState() => _GetListFromApiExampleState();
}

class _GetListFromApiExampleState extends State<GetListFromApiExample> {
  String result = "Load Me".toUpperCase();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Get List From Api Example'),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  result,
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
                        GetListResult.getListFromApi('1', '5').then((value) {
                          result = "";
                          for (var val in value) {
                            result += '[${val.name}]\n\n';
                          }
                          setState(() {
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
                          result = "Load Me".toUpperCase();
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
