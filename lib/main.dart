import 'package:appteste/screens/App_Atividades_Page.dart';
import 'package:appteste/screens/App_Chat_Page.dart';
import 'package:appteste/screens/App_Configs_Page.dart';
import 'package:appteste/screens/App_Home_Page.dart';
import 'package:appteste/screens/App_Login_Page.dart';
import 'package:appteste/screens/App_New_Post.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screens/App_Recover_Page.dart';
import 'screens/App_Register_Page.dart';
import 'screens/App_Splash_Page.dart';
import 'models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            '/configs': (context) => ConfigsPage(),
            '/newpost': (context) => NewPost(),
            '/chat': (context) => ChatPage(),
            '/atividades': (context) => AtividadesPage(),
          },

        )
    );
  }
}

