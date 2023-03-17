import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GenerateQrCodeExample(),
    );
  }
}

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
