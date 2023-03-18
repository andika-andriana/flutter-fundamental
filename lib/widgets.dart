import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCodeExample extends StatelessWidget {
  const GenerateQrCodeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Generate QR Code Example"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Scan Me".toUpperCase(),
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          QrImage(
            version: 6,
            size: 300,
            data: 'https://andika-andriana.github.io',
          ),
        ],
      )),
    ));
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Container(
                color: Colors.black12,
                child: const TabBar(
                  labelColor: Colors.white,
                  indicator: BoxDecoration(
                      color: Colors.cyan,
                      border: Border(
                          bottom: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ))),
                  indicatorColor: Colors.amberAccent,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.home),
                      text: 'Home',
                    ),
                    Tab(
                      icon: Icon(Icons.book_online),
                      text: 'Book',
                    ),
                    Tab(
                      icon: Icon(Icons.shop),
                      text: 'Shop',
                    ),
                    Tab(
                      icon: Icon(Icons.person),
                      text: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
            title: Text(
              'Top tab bar sample'.toUpperCase(),
              style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic),
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(
                Icons.home,
                color: Colors.black12,
                size: 100,
              ),
              Icon(
                Icons.book_online,
                color: Colors.black12,
                size: 100,
              ),
              Icon(
                Icons.shop,
                color: Colors.black12,
                size: 100,
              ),
              Icon(
                Icons.person,
                color: Colors.black12,
                size: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomHeightAppBar extends StatelessWidget {
  const CustomHeightAppBar({super.key});
  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getHeight(context) * 0.3),
        child: AppBar(
          backgroundColor: Colors.black26,
          flexibleSpace: Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  "Custom Height AppBar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: "Poppins",
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class HeroAnimationExample extends StatelessWidget {
  const HeroAnimationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: const Text(
          "Hero Animation Example",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HeroAnimationDetailExample();
          }));
        },
        child: Hero(
          tag: "avatar",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100 / 2),
            child: const SizedBox(
              width: 100,
              height: 100,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://media.licdn.com/dms/image/C5603AQE9N7B89s3HBQ/profile-displayphoto-shrink_400_400/0/1649749505592?e=1683158400&v=beta&t=ruw4t9nkui92bxL0_K8F7Jcmr7HBjONSE-Sr8mzwMJQ",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimationDetailExample extends StatelessWidget {
  const HeroAnimationDetailExample({super.key});
  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: const Text(
          "Hero Animation Detail Example",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: getWidth(context),
        height: getWidth(context),
        child: const Hero(
          tag: "avatar",
          child: SizedBox(
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://media.licdn.com/dms/image/C5603AQE9N7B89s3HBQ/profile-displayphoto-shrink_400_400/0/1649749505592?e=1683158400&v=beta&t=ruw4t9nkui92bxL0_K8F7Jcmr7HBjONSE-Sr8mzwMJQ",
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginExample extends StatelessWidget {
  const LoginExample({super.key});
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getLargeDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: Stack(
        children: <Widget>[
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: -getSmallDiameter(context) / 3,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.pink, Colors.blue],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
            ),
          ),
          Positioned(
            left: -getLargeDiameter(context) / 4,
            top: -getLargeDiameter(context) / 4,
            child: Container(
              width: getLargeDiameter(context),
              height: getLargeDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.pink, Colors.blue],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
              child: const Center(
                child: Text(
                  "IS MY LIFE",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 30,
                    fontFamily: "Poppins",
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.double,
                    decorationThickness: 0.5,
                    decorationColor: Colors.amber,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: -getSmallDiameter(context) / 4,
            bottom: -getSmallDiameter(context) / 4,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(40, 255, 2, 192),
              ),
            ),
          ),
          Align(
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(167, 159, 153, 153),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                  child: Column(
                    children: const <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.white60,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink)),
                          labelText: "Email ",
                          labelStyle: TextStyle(color: Colors.white70),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.password,
                            color: Colors.white60,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink)),
                          labelText: "Password ",
                          labelStyle: TextStyle(color: Colors.white70),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: const Text(
                      "FORGOT PASSWORD? ",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [Colors.pink, Colors.blue],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              splashColor: Colors.blue,
                              onTap: () {},
                              child: const Center(
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        mini: true,
                        elevation: 5,
                        child: const Image(
                          image: AssetImage("images/facebook.png"),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        mini: true,
                        elevation: 5,
                        child: const Image(
                          image: AssetImage("images/twitter.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "DON'T HAVE ACCOUNT? ",
                      style: TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "SIGN UP",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomCardExample extends StatelessWidget {
  const CustomCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Custom Card Example",
          style: TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage("images/app_bar_bg.png"),
                        fit: BoxFit.fill,
                        opacity: 0.2,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/default_images.jpeg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: (MediaQuery.of(context).size.height * 0.3) + 50,
                      bottom: 16,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Dummy Photo from\nSome Place",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.normal,
                              color: Colors.lightBlue,
                              fontSize: 24,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Posted on ",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Oct 2022",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                    color: Colors.lightBlue,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: const [
                                Spacer(flex: 10),
                                Icon(
                                  Icons.thumb_up,
                                  color: Colors.grey,
                                  size: 14,
                                ),
                                Spacer(flex: 1),
                                Text(
                                  "100",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                      color: Colors.grey),
                                ),
                                Spacer(flex: 1),
                                Icon(
                                  Icons.thumb_up,
                                  color: Colors.grey,
                                  size: 14,
                                ),
                                Spacer(flex: 1),
                                Text(
                                  "100",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                      color: Colors.grey),
                                ),
                                Spacer(flex: 10),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InkWellExample extends StatelessWidget {
  const InkWellExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "InkWell Example",
            style: TextStyle(fontFamily: "Poppins"),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.blueAccent.shade700,
                ),
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: const Text(
                    "Test",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Material(
                borderRadius: BorderRadius.circular(6),
                elevation: 5,
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: const LinearGradient(
                      colors: [Colors.blueAccent, Colors.amber],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.brown.shade100,
                      borderRadius: BorderRadius.circular(6),
                      onTap: () {},
                      child: const Center(
                        child: Text(
                          "Test Ink Well",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TempPage());
  }
}

class TempPage extends StatelessWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Media Query Example",
          style: TextStyle(fontFamily: "Poppins"),
        )),
        body: Center(
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: generatorChild(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: generatorChild(),
                ),
        ));
  }
}

List<Widget> generatorChild() {
  return <Widget>[
    Container(
      color: Colors.blueGrey.shade100,
      width: 100,
      height: 100,
    ),
    Container(
      color: Colors.blueGrey.shade200,
      width: 100,
      height: 100,
    ),
    Container(
      color: Colors.blueGrey.shade300,
      width: 100,
      height: 100,
    ),
  ];
}

class TextDecorationExample extends StatefulWidget {
  const TextDecorationExample({super.key});

  @override
  State<TextDecorationExample> createState() => _TextDecorationExampleState();
}

class _TextDecorationExampleState extends State<TextDecorationExample> {
  TextEditingController usernameTextController =
      TextEditingController(text: "");
  TextEditingController passwordTextController =
      TextEditingController(text: "");

  bool isSecure = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.text_fields,
            size: 18,
            color: Colors.black,
          ),
          title: const Text(
            "Text Decoration Example",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.lightBlue],
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
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: const Icon(
                      Icons.facebook_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "Facelook".toUpperCase(),
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 50,
                      fontStyle: FontStyle.normal,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Username",
                          prefixIcon: const Icon(Icons.account_circle_outlined),
                          hintText: "Input username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: usernameTextController,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.lock),
                          hintText: "Input password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                isSecure = !isSecure;
                              });
                            },
                            child: (isSecure)
                                ? const Icon(
                                    Icons.no_encryption,
                                    size: 14,
                                    color: Colors.amber,
                                  )
                                : const Icon(
                                    Icons.lock,
                                    size: 14,
                                    color: Colors.amber,
                                  ),
                          ),
                        ),
                        obscureText: isSecure,
                        maxLength: 8,
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: passwordTextController,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
