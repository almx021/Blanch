import 'package:appteste/screens/App_Alterar_Dados_Page.dart';
import 'package:appteste/screens/App_Atividades_Page.dart';
import 'package:appteste/screens/App_Chat_Page.dart';
import 'package:appteste/screens/App_Configs_Page.dart';
import 'package:appteste/screens/App_EditarPerfil_Page.dart';
import 'package:appteste/screens/App_EmAlta_Page.dart';
import 'package:appteste/screens/App_Home_Page.dart';
import 'package:appteste/screens/App_ItensSalvos_Page.dart';
import 'package:appteste/screens/App_Login_Page.dart';
import 'package:appteste/screens/App_New_Password_Page.dart';
import 'package:appteste/screens/App_New_Post.dart';
import 'package:appteste/screens/App_Perfil_Outro_Usuario_Page.dart';
import 'package:appteste/screens/App_Seguidores_Page.dart';
import 'package:appteste/screens/App_Seguindo_Page.dart';
import 'package:appteste/screens/App_Username_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/user_model.dart';
import 'screens/App_Account_Page.dart';
import 'screens/App_Config_Notifications_Page.dart';
import 'screens/App_Help_Page.dart';
import 'screens/App_Mensagens_Page.dart';
import 'screens/App_Recover_Page.dart';
import 'screens/App_Insert_Code_Page.dart';
import 'screens/App_Register_Page.dart';
import 'screens/App_Sobre_Page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if(FireAuth.userData != null){
    await FireAuth.getInfos();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          theme: ThemeData(
            hintColor: Colors.white,
            primaryColor: Colors.white,
          ),
          title: 'Named Routes Demo',
          initialRoute: '/',
          routes: {
            '/': (context) => AuthenticationWrapper(),
            '/register': (context) => RegisterPage(),
            '/recover': (context) => RecoverPage(),
            '/insertCode': (context) => InsertCodePage(),
            '/newPassword': (context) => NewPasswordPage(),
            '/login': (context) => LoginPage(),
            '/home': (context) => HomePage(),
            '/configs': (context) => ConfigsPage(),
            '/newpost': (context) => NewPost(),
            '/chat': (context) => ChatPage(),
            '/atividades': (context) => AtividadesPage(),
            '/sobre': (context) => SobrePage(),
            '/conta': (context) => AccountPage(),
            '/notificacoes': (context) => NotificationsPage(),
            '/ajuda': (context) => HelpPage(),
            '/mensagens': (context) => MensagemPage(),
            '/emAlta': (context) => EmAltaPage(),
            '/Seguidores': (context) => SeguidoresPage(),
            '/Seguindo': (context) => SeguindoPage(),
            '/PerfilOutroUsuario': (context) => PerfilOutroUsuarioPage(),
/*
            '/perfil': (context) => PerfilPage(),
*/
            '/itensSalvos': (context) => ItensSalvosPage(),
            '/AlterarDados': (context) => AlterarDadosPage(),
            '/editarPerfil': (context) => EditarPerfilPage(),
            '/username': (context) => UsernamePage(),
          },
        );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;


    if (user != null) {

      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
