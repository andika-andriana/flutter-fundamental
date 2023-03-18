import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QrCodeReaderExample(),
    );
  }
}

class QrCodeReaderExample extends StatefulWidget {
  const QrCodeReaderExample({super.key});

  @override
  State<QrCodeReaderExample> createState() => _QrCodeReaderExampleState();
}

class _QrCodeReaderExampleState extends State<QrCodeReaderExample> {
  String scanResult = 'Hasil Scan';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Qr Code Reader Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(scanResult),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await Permission.camera.request();
                  String? barcode = await scanner.scan();
                  setState(() {
                    scanResult = barcode.toString();
                  });
                },
                child: Text(
                  'scan'.toUpperCase(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
