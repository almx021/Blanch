import 'package:appteste/core/App_Login_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'core/App_Splash_Page.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    theme: ThemeData(
      hintColor: Colors.white,
      primaryColor: Colors.white,

    ),
  ));
}
