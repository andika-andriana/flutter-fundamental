import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Container Example"),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                Colors.lightBlue.shade50,
                Colors.lightBlue.shade200
              ])),
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 50),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
          child: Container(
            color: Colors.blueGrey.shade200,
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                      Colors.lightBlue.shade200,
                      Colors.lightBlue.shade50
                    ])),
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 50)),
          ),
        ),
      ),
    );
  }
}

class RowAndColoumnExample extends StatelessWidget {
  const RowAndColoumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Latihan Row dan Column"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Text 1"),
              Text("Text 2"),
              Text("Text 3"),
              Text("Text 4"),
              Text("Text 5"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Text("Text 6"),
                  Text("Text 7"),
                  Text("Text 8"),
                  Text("Text 9"),
                  Text("Text 10")
                ],
              ),
            ],
          )),
    );
  }
}

// TEXT EXAMPLE
class TextExample extends StatelessWidget {
  const TextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Lorem Ipsum")),
          body: Center(
            child: Container(
              color: Colors.lightBlue.shade200,
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                textAlign: TextAlign.justify,
                softWrap: true,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
              ),
            ),
          )),
    );
  }
}
