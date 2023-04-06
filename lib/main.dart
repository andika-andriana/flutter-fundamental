import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/services/firebase_firestore_services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      home: const FirebaseFirestoreExample(),
    );
  }
}

class FirebaseFirestoreExample extends StatefulWidget {
  const FirebaseFirestoreExample({super.key});

  @override
  State<FirebaseFirestoreExample> createState() =>
      _FirebaseFirestoreExampleState();
}

class _FirebaseFirestoreExampleState extends State<FirebaseFirestoreExample> {
  bool isLoading = false;
  int selectedIndex = 0;
  String product = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Firestore Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            product != ""
                ? Column(
                    children: [
                      const Text("Product : "),
                      Text(product),
                    ],
                  )
                : Container(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                  selectedIndex = 0;
                });
                FirebaseFirestoreService.createOrEditProduct(
                  "1",
                  "T-shirt",
                  20000,
                ).whenComplete(() {
                  Timer(const Duration(milliseconds: 2000), () {
                    setState(() {
                      isLoading = false;
                    });
                  });
                });
              },
              child: Text(
                isLoading == true && selectedIndex == 0
                    ? "Loading..."
                    : "Add Product",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                  selectedIndex = 1;
                });
                FirebaseFirestoreService.createOrEditProduct(
                  "1",
                  "T-Shirt",
                  12500,
                ).whenComplete(() {
                  Timer(const Duration(milliseconds: 2000), () {
                    setState(() {
                      isLoading = false;
                    });
                  });
                });
              },
              child: Text(
                isLoading == true && selectedIndex == 1
                    ? "Loading..."
                    : "Edit Product",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                  selectedIndex = 2;
                });
                FirebaseFirestoreService.getProductById("1")
                    .then(
                  (snapshot) => setState(() {
                    product = snapshot.data().toString();
                  }),
                )
                    .whenComplete(() {
                  Timer(const Duration(milliseconds: 2000), () {
                    setState(() {
                      isLoading = false;
                    });
                  });
                });
              },
              child: Text(
                isLoading == true && selectedIndex == 2
                    ? "Loading..."
                    : "Get Product",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                  selectedIndex = 3;
                });
                FirebaseFirestoreService.deleteProducById("1").whenComplete(() {
                  Timer(const Duration(milliseconds: 2000), () {
                    setState(() {
                      isLoading = false;
                      product = "";
                    });
                  });
                });
              },
              child: Text(
                isLoading == true && selectedIndex == 3
                    ? "Loading..."
                    : "Delete Product",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
