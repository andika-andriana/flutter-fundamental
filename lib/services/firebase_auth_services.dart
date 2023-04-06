// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/utils/flutter_toast.dart';

class FirebaseAuthServices {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static Future<User?> signInAnonymously() async {
    try {
      final userCredential = await firebaseAuth.signInAnonymously();
      FlutterToast.showToast(
        "Signed in with temporary account.",
      );
      User? user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          FlutterToast.showToast(
            "Anonymous auth hasn't been enabled for this project.",
          );
          break;
        default:
          FlutterToast.showToast(
            "Unknown error.",
          );
      }
      return null;
    }
  }

  static Future<User?> signUpEmail(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        FlutterToast.showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        FlutterToast.showToast('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      FlutterToast.showToast(e.toString());
      return null;
    }
  }

  static Future<User?> signInEmail(String email, String password) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        FlutterToast.showToast('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        FlutterToast.showToast('Wrong password provided for that user.');
      }
      return null;
    } catch (e) {
      FlutterToast.showToast(e.toString());
      return null;
    }
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Stream<User?> get firabaseUserStream =>
      firebaseAuth.authStateChanges();
}
