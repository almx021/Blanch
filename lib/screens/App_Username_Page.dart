import 'package:appteste/core/App_Images.dart';
import 'package:appteste/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appteste/core/App_Logos.dart';
import '../core/App_Gradients.dart';
import 'App_Home_Page.dart';

class UsernamePage extends StatefulWidget {
  @override
  _UsernamePageState createState() => _UsernamePageState();
}

User user = FirebaseAuth.instance.currentUser;

class _UsernamePageState extends State<UsernamePage> {
  final _usernameController = TextEditingController();
  final _focusUsername = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          _focusUsername.unfocus();
        },
        child: ScaffoldMessenger(
          key: _scaffoldMessengerKey,
            child: Scaffold(
                body: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                  decoration: BoxDecoration(gradient: AppGradients.linear)),
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Logos.buildMiniLogo(context, width, height, AppImages.logo),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0.26 * height),
                          child: Text(
                            'Bem vindo ao Blanch!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0.1 * height),
                          child: Text(
                            'Informe seu nome de usuário:',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 0.017 * height,
                              left: width < 360 ? 0.09 * width : 0.1 * width,
                              right: width < 360 ? 0.09 * width : 0.1 * width),
                          child: TextFormField(
                            controller: _usernameController,
                            focusNode: _focusUsername,
                            validator: _validator,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                )),
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                        Divider(color: Colors.transparent),
                        Container(
                          padding: EdgeInsets.only(top: 5.0),
                          child: TextButton(
                            onPressed: () async {

                              bool usernameValidated = await userValidate(_usernameController.text);
                              print("antesdoif $usernameValidated");
                              if (_formKey.currentState.validate() && usernameValidated == true) {
                                FirebaseAuth auth = FirebaseAuth.instance;
                                User user = auth.currentUser;

                                await FireAuth.updateUsername(username: _usernameController.text, getInfos: FireAuth.getInfos);
                                print("dentro do if $usernameValidated");
                                if (user != null && usernameValidated == true) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                  );
                                }
                              }

                              print("dps de tudo $usernameValidated");
                              setState(() {
                                usernameValidated = true;
                              });

                              },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: BorderSide(color: Colors.white)),
                            ),
                            child: Ink(
                                decoration: BoxDecoration(
                                  gradient: AppGradients.orangelinear,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Container(
                                  height: 50.0,
                                  width: 130.0,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Salvar',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ))));
  }


  Future<bool> userValidate(String username) async {
    FirebaseFirestore firestore =
        FirebaseFirestore.instance;
    /*await firestore.collection("users").where("username", isEqualTo: username).get().then((doc) => {
      if (doc.exists) {
        print("kofdsdfs")
      }
    });*/
    var collection = firestore.collection("users");
    final docSnapshot = await collection.where("username", isEqualTo: username).get();
    print(docSnapshot);
    print(docSnapshot.docs.length);

    if(docSnapshot.docs.length > 0) {
      _onFail();
      return false;
    }

    return true;
    /*if(docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data();
      print("dados tela home${data['newUser']}");
      return data['newUser'];
    }*/

    /*if (userExistsInDB != null) {
      return false;
    } else {
      return true;
    }*/

  }

  void _onFail() {

    _scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário já existe"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }

  /*void _onFailUserLength() {

    _scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário precisa ter no mínimo 5 caracteres"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
*/
  String _validator(String value) {
    if (value.length < 5 || value.isEmpty) {
      return "Username is too short";
    }
  }
}
