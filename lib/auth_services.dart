import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubes_lomboknation/screens/homescreen_screens.dart';

class authServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<FirebaseUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<FirebaseUser?> signInWithEmailAndPassword(
      String email, String password, context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                print('user loged in'),
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false)
              });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Stream<FirebaseUser> get firebaseUserStream =>
      _auth.onAuthStateChanged;
}
