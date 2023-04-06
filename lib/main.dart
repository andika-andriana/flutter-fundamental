import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/main_page.dart';
import 'package:flutter_application_1/services/firebase_auth_services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const FirebaseAuthAnonymousExample();
  }
}

class FirebaseAuthAnonymousExample extends StatelessWidget {
  const FirebaseAuthAnonymousExample({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: FirebaseAuthServices.firabaseUserStream,
      initialData: null,
      child: const MaterialApp(
        home: FirebaseAuthAnonymousWrapper(),
      ),
    );
  }
}

class FirebaseAuthAnonymousWrapper extends StatelessWidget {
  const FirebaseAuthAnonymousWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    return (user == null) ? LoginPage() : const MainPage();
  }
}
