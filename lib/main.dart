import 'package:appteste/core/App_Login_Page.dart';
import 'package:appteste/core/App_Recover_Page.dart';
import 'package:appteste/core/App_Register_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'core/App_Splash_Page.dart';

void main() {
  runApp(MaterialApp(

    theme: ThemeData(
      hintColor: Colors.white,
      primaryColor: Colors.white,
    ),


    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
      '/recover': (context) => RecoverPage(),
    },

  ));
}
