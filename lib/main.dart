import 'package:flutter/material.dart';
import 'package:flutter_application_1/post_result_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PostToApiExample(),
    );
  }
}

class PostToApiExample extends StatefulWidget {
  const PostToApiExample({super.key});

  @override
  State<PostToApiExample> createState() => _PostToApiExampleState();
}

class _PostToApiExampleState extends State<PostToApiExample> {
  PostResult? postResult;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Clip Example'),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  (postResult != null)
                      ? ' id: ${postResult?.id}\n name: ${postResult?.name}\n job: ${postResult?.job}\n created At: ${postResult?.created}'
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
                        PostResult.postToAPI('Andika', 'Mobile Dev')
                            .then((value) {
                          setState(() {
                            postResult = value;
                            isLoading = false;
                          });
                        });
                      },
                      child: Text(
                        isLoading ? 'Loading..' : 'Post'.toUpperCase(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isLoading = false;
                          postResult = null;
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
