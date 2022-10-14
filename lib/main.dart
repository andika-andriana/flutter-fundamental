import 'dart:math';

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
          title: const Text("Flexible Layout",
              style: TextStyle(fontFamily: "Poppins")),
        ),
        body: Column(
          children: [
            Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        color: Colors.blueGrey.shade100,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        color: Colors.blueGrey.shade200,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        color: Colors.blueGrey.shade300,
                      ),
                    )
                  ],
                )),
            Flexible(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(4),
                  color: Colors.blueAccent.shade200,
                )),
            Flexible(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(4),
                  color: Colors.blueAccent.shade400,
                ))
          ],
        ),
      ),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  // NEED IMPORT OBJ TO USE RANDOM NUMBER
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Animated Container Example"),
        ),
        body: Center(
          child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: 10.1 + random.nextInt(101),
                    height: 10.1 + random.nextInt(101),
                    color: Color.fromARGB(255, random.nextInt(256),
                        random.nextInt(256), random.nextInt(256)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Text(
                      "Tap The Box To Change",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 24,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.wavy,
                          decorationColor: Colors.blueAccent,
                          decorationThickness: 5),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class ListAndListViewExample extends StatefulWidget {
  const ListAndListViewExample({super.key});

  @override
  State<ListAndListViewExample> createState() => _ListAndListViewExampleState();
}

class _ListAndListViewExampleState extends State<ListAndListViewExample> {
  List<Widget> widgets = [];
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("List & ListView"),
          ),
          body: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (counter < 50) {
                            widgets.add(Text(
                              "Text $counter",
                              style: const TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.wavy,
                                decorationColor: Colors.black12,
                              ),
                            ));
                            counter++;
                          } else {
                            widgets.clear();
                            counter = 1;
                          }
                        });
                      },
                      child: const Text("Add Row")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (counter > 1) {
                            widgets.removeLast();
                            counter--;
                          }
                        });
                      },
                      child: const Text("Remove Row")),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widgets,
              )
            ],
          )),
    );
  }
}

class CustomFontExample extends StatelessWidget {
  const CustomFontExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text("Lorem Ipsum")),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ),
    ));
  }
}

class StateFull extends StatefulWidget {
  const StateFull({super.key});

  @override
  State<StateFull> createState() => _StateFullState();
}

class _StateFullState extends State<StateFull> {
  int number = 1;

  void tambahBilangan() {
    if (number > 49) {
      setState(() {
        number = 0;
      });
    } else {
      setState(() {
        number = number + 1;
      });
    }
  }

  void kurangBiliangan() {
    if (number < 1) {
      setState(() {
        number = 50;
      });
    } else {
      setState(() {
        number = number - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text("Statefull Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number.toString(),
              style: TextStyle(
                  color: Colors.black, fontSize: 10 + number.toDouble()),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text("Tambah Bilangan"),
                      onPressed: tambahBilangan,
                    ),
                    ElevatedButton(
                      child: Text("Kurang Bilangan"),
                      onPressed: kurangBiliangan,
                    ),
                  ],
                )),
            Container(
              child: ElevatedButton(
                child: Text("Back to Zero"),
                onPressed: () {
                  setState(() {
                    number = 0;
                  });
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

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
            title: const Text("Row & Column Example"),
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

class TextExample extends StatelessWidget {
  const TextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Text Example")),
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
