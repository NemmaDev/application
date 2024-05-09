// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:html';

import 'package:application/screens/guest.dart';
import 'package:application/screens/guest/auth.dart';
import 'package:application/screens/guest/password.dart';
import 'package:application/screens/guest/terms.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Application',
    //   home: guestScreen(),
    // );
    appBar:
    AppBar(title: Text("bienvenu"));
    Body:
    FutureBuilder(
        future: _App,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("erreur");
          } else if (snapshot.data) {
            return Text("firbase");
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
