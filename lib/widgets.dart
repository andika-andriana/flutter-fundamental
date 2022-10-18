import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';

class CardAndAppBarExample extends StatelessWidget {
  const CardAndAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.adb,
            size: 18,
            color: Colors.white,
          ),
          title: const Text(
            "Pattern AppBar",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 18,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 18,
              ),
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.grey],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
              image: DecorationImage(
                image: AssetImage("images/app_bar_bg.png"),
                fit: BoxFit.none,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.grey.shade400,
          child: ListView(
            children: [
              buildCard(
                const Icon(
                  Icons.email,
                  color: Colors.black54,
                ),
                const Text(
                  "Inbox",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black54,
                  ),
                ),
              ),
              buildCard(
                const Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black54,
                  ),
                ),
              ),
              buildCard(
                const Icon(
                  Icons.notifications,
                  color: Colors.black54,
                ),
                const Text(
                  "Notification",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card buildCard(Icon iconName, Text title) {
    return Card(
      color: Colors.grey.shade300,
      elevation: 5,
      margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: iconName,
            ),
            title
          ],
        ),
      ),
    );
  }
}

class MaterialNavigatorExample extends StatelessWidget {
  const MaterialNavigatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

class DragableWidgetExample extends StatefulWidget {
  const DragableWidgetExample({super.key});

  @override
  State<DragableWidgetExample> createState() => _DragableWidgetExampleState();
}

class _DragableWidgetExampleState extends State<DragableWidgetExample> {
  Color color1 = Colors.blue;
  Color color2 = Colors.green;
  late Color colorTarget;

  bool isAcceptIt = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Draggable Widget",
            style: TextStyle(fontFamily: "Poppins"),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // DRAGABLE TARGET
            DragTarget<Color>(
              onWillAccept: (val) => true,
              onAccept: (val) {
                isAcceptIt = true;
                colorTarget = val;
              },
              builder: ((context, candidateData, rejectedData) {
                return isAcceptIt
                    ? SizedBox(
                        width: 150,
                        height: 150,
                        child: Material(
                          color: colorTarget,
                          shape: const StadiumBorder(),
                        ),
                      )
                    : const SizedBox(
                        width: 150,
                        height: 150,
                        child: Material(
                          color: Colors.black38,
                          shape: StadiumBorder(),
                        ),
                      );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // DRAGABLE 1
                Draggable<Color>(
                  data: color1,
                  childWhenDragging: const SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      color: Colors.black38,
                      shape: StadiumBorder(),
                    ),
                  ),
                  feedback: SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      color: color1.withOpacity(0.5),
                      shape: const StadiumBorder(),
                    ),
                  ),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      color: color1,
                      shape: const StadiumBorder(),
                    ),
                  ),
                ),

                // DRAGABLE 2
                Draggable<Color>(
                  data: color2,
                  childWhenDragging: const SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      color: Colors.black38,
                      shape: StadiumBorder(),
                    ),
                  ),
                  feedback: SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      color: color2.withOpacity(0.5),
                      shape: const StadiumBorder(),
                    ),
                  ),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      color: color2,
                      shape: const StadiumBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: const Text(
                "Drag Child to Parent Circle",
                style: TextStyle(
                  fontFamily: "Poppins",
                  decoration: TextDecoration.overline,
                  decorationStyle: TextDecorationStyle.wavy,
                  decorationThickness: 5,
                  decorationColor: Colors.amber,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LayoutSpacerExample extends StatelessWidget {
  const LayoutSpacerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Layout Spacer Example",
            style: TextStyle(fontFamily: "Poppins"),
          ),
        ),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 80,
              height: 80,
              color: Colors.blueAccent.shade100,
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.blueAccent.shade200,
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.blueAccent.shade400,
            )
          ],
        )),
      ),
    );
  }
}

class ImageWidgetExample extends StatefulWidget {
  const ImageWidgetExample({super.key});

  @override
  State<ImageWidgetExample> createState() => _ImageWidgetExampleState();
}

class _ImageWidgetExampleState extends State<ImageWidgetExample> {
  List<Widget> lists = [];

  _ImageWidgetExampleState() {
    for (var i = 0; i < 12; i++) {
      // ASSETS IMAGES
      lists.add(const SizedBox(
        child: Image(
          image: AssetImage("images/default_images.jpeg"),
        ),
      ));

      // NETWORK IMAGES
      // lists.add(SizedBox(
      //   height: 300,
      //   width: 300,
      //   child: Image(
      //     image: NetworkImage("https://i.pravatar.cc/30$i"),
      //     fit: BoxFit.contain,
      //   ),
      // ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Image Widget Example",
            style: TextStyle(fontFamily: "Poppins"),
          ),
        ),
        body: GridView.extent(
            maxCrossAxisExtent: 200,
            padding: const EdgeInsets.all(8),
            crossAxisSpacing: 8,
            children: lists),
      ),
    );
  }
}

class StackLayoutExample extends StatelessWidget {
  const StackLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
          "Stack Layout Example",
          style: TextStyle(fontFamily: "Poppins"),
        )),
        body: Stack(
          // BACKGROUND
          children: [
            Column(
              children: [
                Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.black12,
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.black38,
                            )),
                      ],
                    )),
                Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.black38,
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.black12,
                            )),
                      ],
                    )),
              ],
            ),

            // TEXT-LISTVIEW
            ListView(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                    children: const [
                      Text(
                        "Apakah Lorem Ipsum itu?",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            color: Colors.black87),
                      ),
                      Text(
                        "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                    children: const [
                      Text(
                        "Dari mana asalnya?",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            color: Colors.black87),
                      ),
                      Text(
                        "Tidak seperti anggapan banyak orang, Lorem Ipsum bukanlah teks-teks yang diacak. Ia berakar dari sebuah naskah sastra latin klasik dari era 45 sebelum masehi, hingga bisa dipastikan usianya telah mencapai lebih dari 2000 tahun. Richard McClintock, seorang professor Bahasa Latin dari Hampden-Sidney College di Virginia, mencoba mencari makna salah satu kata latin yang dianggap paling tidak jelas, yakni consectetur, yang diambil dari salah satu bagian Lorem Ipsum. Setelah ia mencari maknanya di di literatur klasik, ia mendapatkan sebuah sumber yang tidak bisa diragukan. Lorem Ipsum berasal dari bagian 1.10.32 dan 1.10.33 dari naskah 'de Finibus Bonorum et Malorum' (Sisi Ekstrim dari Kebaikan dan Kejahatan) karya Cicero, yang ditulis pada tahun 45 sebelum masehi. BUku ini adalah risalah dari teori etika yang sangat terkenal pada masa Renaissance. Baris pertama dari Lorem Ipsum, 'Lorem ipsum dolor sit amet..', berasal dari sebuah baris di bagian 1.10.32.\n\nBagian standar dari teks Lorem Ipsum yang digunakan sejak tahun 1500an kini di reproduksi kembali di bawah ini untuk mereka yang tertarik. Bagian 1.10.32 dan 1.10.33 dari 'de Finibus Bonorum et Malorum' karya Cicero juga di reproduksi persis seperti bentuk aslinya, diikuti oleh versi bahasa Inggris yang berasal dari terjemahan tahun 1914 oleh H. Rackham.",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: const Alignment(0.9, 0.9),
              child: ElevatedButton(
                child: const Text("My Button"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlexibleLayoutExample extends StatelessWidget {
  const FlexibleLayoutExample({super.key});

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
                      onPressed: tambahBilangan,
                      child: const Text("Tambah Bilangan"),
                    ),
                    ElevatedButton(
                      onPressed: kurangBiliangan,
                      child: const Text("Kurang Bilangan"),
                    ),
                  ],
                )),
            ElevatedButton(
              child: const Text("Back to Zero"),
              onPressed: () {
                setState(() {
                  number = 0;
                });
              },
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
              const Text("Text 1"),
              const Text("Text 2"),
              const Text("Text 3"),
              const Text("Text 4"),
              const Text("Text 5"),
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
