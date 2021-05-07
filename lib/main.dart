import 'package:appteste/screens/App_Home_Page.dart';
import 'package:appteste/screens/App_Login_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screens/App_Recover_Page.dart';
import 'screens/App_Register_Page.dart';
import 'screens/App_Splash_Page.dart';
import 'models/user_model.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: MaterialApp( theme: ThemeData(
          hintColor: Colors.white,
          primaryColor: Colors.white,
        ),


          title: 'Named Routes Demo',
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/register': (context) => RegisterPage(),
            '/recover': (context) => RecoverPage(),
            '/home': (context) => HomePage(),
          },

        )
    );
  }
}

