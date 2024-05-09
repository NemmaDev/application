// ignore_for_file: unused_field, camel_case_types, avoid_print

import 'package:application/model/userModel.dart';
import 'package:application/screens/guest/auth.dart';
import 'package:application/screens/guest/password.dart';
import 'package:application/screens/guest/terms.dart';
import 'package:application/screens/services/userServices.dart';
import 'package:flutter/material.dart';

class guestScreen extends StatefulWidget {
  const guestScreen({super.key});

  @override
  State<guestScreen> createState() => _guestScreenState();
}

class _guestScreenState extends State<guestScreen> {
  userServices _userServices = userServices();
  List<Widget> _widget = [];
  int _indexSelected = 0;
  String _email = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widget.addAll([
      authScreens(
        onChangedStep: (index, value) => setState(() {
          _indexSelected = index;
          _email = value;
          // ignore: prefer_const_constructors
        }),
        key: ValueKey('auth_screen'),
      ),
      termScreen(
        onChangedStep: (index) => setState(() {
          _indexSelected = index;
          // ignore: prefer_const_constructors
        }),
        key: ValueKey('term_screen'),
      ),
      passwordScreen(
        onChangedStep: (index, value) => setState(() {
          if (index != null) {
            _indexSelected = index;
            // ignore: prefer_const_constructors
          }
          if (value != null) {
            _userServices
                .auth(userModel(email: _email, password: value, uid: ''))
                .then((value) => print(value.toJson()));
          }
        }),
        key: ValueKey('password_screen'),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widget.elementAt(_indexSelected),
    );
  }
}
