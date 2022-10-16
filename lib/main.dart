import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';

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
