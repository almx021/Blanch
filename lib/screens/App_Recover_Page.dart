import 'package:appteste/core/App_Logos.dart';
import 'package:appteste/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../core/App_Gradients.dart';
import '../core/App_Images.dart';

class RecoverPage extends StatefulWidget {
  @override
  _RecoverPageState createState() => _RecoverPageState();
}

class _RecoverPageState extends State<RecoverPage> {
  final _emailController = TextEditingController();
  final _focusEmail = FocusNode();

  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return GestureDetector(
        onTap: () {
          _focusEmail.unfocus();
        },
        child: ScaffoldMessenger(
            key: _scaffoldMessengerKey,
            child: Scaffold(
                body: Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            gradient: AppGradients.linear)),
                    SingleChildScrollView(
                      child: Stack(
                        children: [
                          Logos.buildMiniLogo(
                              context, width, height, AppImages.logo),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 0.26 * height),
                                child: Text(
                                  'RECUPERAR SENHA',
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
                                  'Informe o email da sua conta',
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
                                    left: width < 360 ? 0.09 * width : 0.1 *
                                        width,
                                    right: width < 360 ? 0.09 * width : 0.1 *
                                        width),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      labelText: 'Email',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            50.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white),
                                        borderRadius: BorderRadius.circular(
                                            50.0),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                      )),
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                              ),
                              Divider(color: Colors.transparent),
                              Container(
                                padding: EdgeInsets.only(top: 5.0),
                                child: TextButton(
                                  onPressed: () async {
                                    _focusEmail.unfocus();
                                    if (_emailController.text.isEmpty) {
                                      _scaffoldMessengerKey.currentState
                                          .showSnackBar(SnackBar(
                                        content: Text("Insira seu email"),
                                        backgroundColor: Colors.redAccent,
                                        duration: Duration(seconds: 2),
                                      ));
                                    } else {
                                      await FireAuth.passwordRecover(
                                          _emailController.text);
                                      Navigator.pushNamed(
                                          context, '/insertCode');
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            50.0),
                                        side: BorderSide(color: Colors.white)),
                                  ),
                                  child: Ink(
                                      decoration: BoxDecoration(
                                        gradient: AppGradients.orangelinear,
                                        borderRadius: BorderRadius.circular(
                                            50.0),
                                      ),
                                      child: Container(
                                        height: 50.0,
                                        width: 130.0,
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Enviar',
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
                )
            )));
  }
}
