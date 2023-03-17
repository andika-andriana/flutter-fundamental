import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TabBarExample(),
    );
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
