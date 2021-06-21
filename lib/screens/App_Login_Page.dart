
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/models/user_model.dart';
import 'package:appteste/screens/App_Username_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../core/App_Gradients.dart';
import 'App_Home_Page.dart';
import 'App_Register_Page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _passwordLoginVisible = false;

  bool _isProcessing = false;

  bool isNewUser;



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: ScaffoldMessenger(
        key: _scaffoldMessengerKey,
        child: Scaffold(
          body: FutureBuilder(
              builder: (context, snapshot) {
                return Form(
                    key: _formKey,
                    child: Stack(
                      children: [
                        Container(
                            decoration:
                            BoxDecoration(gradient: AppGradients.linear)),
                        SingleChildScrollView(
                          padding: EdgeInsets.fromLTRB(
                              0.1 * width, 0.12 * height, 0.1 * width, 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.logo,
                                width: 0.3 * width,
                                height: 0.135 * height,
                              ),
                              Text("BLANCH",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 0.00015 * width * height,
                                      color: Colors.white,
                                      shadows: <Shadow>[
                                        Shadow(
                                            color: Colors.blue[900],
                                            offset: Offset(0.3, 0.5),
                                            blurRadius: 1.5)
                                      ])),
                              Padding(
                                padding: EdgeInsets.only(top: 0.03 * height),
                                child: Column(children: <Widget>[
                                  Container(
                                    width: 0.8 * width,
                                    height: 0.09 * height,
                                    child: TextFormField(
                                      controller: _emailTextController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          labelText: 'Email',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(50.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.white),
                                            borderRadius:
                                            BorderRadius.circular(50.0),
                                          ),
                                          labelStyle: TextStyle(
                                            color: Colors.white,
                                          )),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                    ),
                                  ),
                                  Divider(color: Colors.transparent),
                                  Stack(
                                    children: [
                                      Container(
                                        width: 0.8 * width,
                                        height: 0.09 * height,
                                        child: TextFormField(
                                          obscureText: !_passwordLoginVisible,
                                          controller: _passwordTextController,
                                          keyboardType: TextInputType.text,
                                          //obscureText: true,
                                          decoration: InputDecoration(
                                              labelText: 'Senha',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(50.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                BorderRadius.circular(50.0),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Colors.white,
                                              )),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              color:
                                              Color.fromRGBO(1, 1, 1, 0.35),
                                              padding: EdgeInsets.only(
                                                  top: 0.007 * height,
                                                  right: 0.045 * width),
                                              icon: Icon(_passwordLoginVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                              onPressed: () {
                                                setState(() {
                                                  _passwordLoginVisible =
                                                  !_passwordLoginVisible;
                                                });
                                              })
                                        ],
                                      )
                                    ],
                                  ),
                                ]),
                              ),
                              Container(
                                  height: 0.06 * height,
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/recover');
                                        },
                                        child: Text(
                                          'Recuperar senha',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                padding: EdgeInsets.only(top: 5.0),
                                child: TextButton(
                                  onPressed: () async {
                                    _focusEmail.unfocus();
                                    _focusPassword.unfocus();

                                    if (_formKey.currentState.validate()) {

                                      User user = await FireAuth
                                          .signInUsingEmailPassword(
                                        email: _emailTextController.text,
                                        password: _passwordTextController.text,
                                        context: context,
                                        onFail: _onFail,
                                        onSuccess: _onSuccess,
                                        getInfos: FireAuth.getInfos,
                                      );


                                      if (user != null) {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage(),
                                          ),
                                        );
                                      } else {
                                        return _onFail();
                                      }
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(30.0),
                                        side: BorderSide(color: Colors.white)),
                                  ),
                                  child: Ink(
                                      decoration: BoxDecoration(
                                        gradient: AppGradients.orangelinear,
                                        borderRadius:
                                        BorderRadius.circular(30.0),
                                      ),
                                      child: Container(
                                        height: 0.08 * height,
                                        width: 0.40 * width,
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 21.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height * 0.03, bottom: height * 0.03),
                                child: Container(
                                    child: Row(children: <Widget>[
                                      Expanded(
                                          child: Divider(
                                            color: Colors.black,
                                            endIndent: 20,
                                            thickness: 1,
                                          )),
                                      Text("OU",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 17.0)

                                      ),
                                      Expanded(
                                          child: Divider(
                                            color: Colors.black,
                                            indent: 20,
                                            thickness: 1,
                                          )),
                                    ])),
                              ),
                              Container(
                                height: width <= 360
                                    ? (0.16 * width)
                                    : width <= 450
                                    ? (0.14 * width)
                                    : (0.12 * width),
                                width: width <= 360
                                    ? (0.62 * width)
                                    : width <= 450
                                    ? (0.55 * width)
                                    : (0.6 * width),
                                //         decoration: BoxDecoration(
                                //            borderRadius: BorderRadius.circular(50.0)),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(30.0),
                                          side:
                                          BorderSide(color: Colors.white)),
                                    ),
                                    onPressed: () async {

                                      User user = await FireAuth.signInWithGoogle(onSuccess: _onSuccessGoogle, onFail: _onFail, getInfos: FireAuth.getInfos);
                                      if (user != null) {
                                        print(verifyIsNewUser());
                                        isNewUser = await verifyIsNewUser();
                                        if(isNewUser) {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UsernamePage(),
                                            ),
                                          );
                                          /*await showDialog(
                                          barrierDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                          return AlertDialog();
                                        });*/
                                        } else {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage(),
                                            ),
                                          );
                                        }

                                      }

                                      /*if(isNewUser) {
                                        return UsernamePage();
                                        *//*await showDialog(
                                          barrierDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                          return AlertDialog();
                                        });*//*
                                      }*/
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 0.008 * width),
                                          child: Image.asset(
                                            AppImages.iconGoogle,
                                            height: width <= 375
                                                ? 0.1 * width
                                                : 0.09 * width,
                                            width: width <= 375
                                                ? 0.1 * width
                                                : 0.09 * width,
                                          ),
                                        ),
                                        Text(
                                          'Entrar com o google',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize:
                                              width <= 375 ? 13.0 : 14.0,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.only(top: height * 0.09),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => RegisterPage(),
                                        ),
                                      );
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Não tem uma conta? ',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 15.0,
                                          shadows: [
                                            Shadow(
                                              blurRadius: 4.0,
                                              color:
                                              Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 4.0),
                                            ),
                                          ],
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Cadastre-se',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ));
              }
          ),
        ),
      ),
    );
  }
  Future<bool> verifyIsNewUser() async {
    User user = FirebaseAuth.instance.currentUser;
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(user.uid).get();
    if(docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data();
      print("dados tela home${data['newUser']}");
      return data['newUser'];
    }
  }

  void _onFail() {

    _scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
      content: Text("Email ou senha inválidos!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }

  void _onSuccess() {
    _scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário criado com sucesso!"),
      backgroundColor: Colors.greenAccent,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onSuccessGoogle() {
    _scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
      content: Text("Login feito com sucesso"),
      backgroundColor: Colors.greenAccent,
      duration: Duration(seconds: 2),
    ));
  }

}






