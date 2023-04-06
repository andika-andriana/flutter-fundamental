import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firebase_auth_services.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_application_1/pages/second_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Main Page",
          style: TextStyle(fontFamily: "Poppins"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("User: ${user?.uid}"),
            ElevatedButton(
              child: const Text(
                "Sign Out",
                style: TextStyle(fontFamily: "Poppins"),
              ),
              onPressed: () {
                FirebaseAuthServices.signOut();
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return const SecondPage();
                // }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
