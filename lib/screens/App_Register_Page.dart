import 'package:appteste/core/App_Images.dart';
import 'package:appteste/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:appteste/core/App_Logos.dart';

import '../core/App_Gradients.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _passwordRegisterVisible1;
  bool _passwordRegisterVisible2;

  final _nameController = TextEditingController();
  // final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    _passwordRegisterVisible1 = false;
    _passwordRegisterVisible2 = false;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ScaffoldMessenger(
        key: _scaffoldMessengerKey,
        child: Scaffold(
          body: ScopedModelDescendant<UserModel>(
            builder: (context, child, model) {
              return Form(
                  key: _formKey,
                  child: Container(
                      decoration: BoxDecoration(gradient: AppGradients.linear),
                      height: height,
                      child: SingleChildScrollView(
                          child: Stack(
                        children: [
                          Logos.buildMiniLogo(
                              context, width, height, AppImages.logo),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0.05 * width, 0.15 * height, 0.05 * width, 0.0),
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: height * 0.075,
                                          bottom: height * 0.05),
                                      child: Text(
                                        'CADASTRAR',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          minHeight: 0.065 * height),
                                      width: 0.85 * width,
                                      child: TextFormField(
                                        controller: _nameController,
                                        validator: (text) {
                                          if (text.isEmpty)
                                            return "Nome Inválido!";
                                        },
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            labelText: 'Seu Nome',
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
                                            fontSize: 14.0),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          minHeight: 0.065 * height),
                                      width: 0.85 * width,
                                      padding: EdgeInsets.only(),
                                      child: TextFormField(
                                        controller: _emailController,
                                        validator: (text) {
                                          if (text.isEmpty ||
                                              !text.contains("@"))
                                            return "Email Inválido!";
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            labelText: 'Email',
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
                                            fontSize: 14.0),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          minHeight: 0.065 * height),
                                      width: 0.85 * width,
                                      child: Stack(
                                        children: [
                                          TextFormField(
                                            controller: _passwordController,
                                            validator: (text) {
                                              if (text.isEmpty ||
                                                  text.length < 6)
                                                return "Senha Inválida!";
                                            },
                                            keyboardType: TextInputType.text,
                                            obscureText:
                                                !_passwordRegisterVisible1,
                                            decoration: InputDecoration(
                                                labelText: 'Senha',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                ),
                                                labelStyle: TextStyle(
                                                  color: Colors.white,
                                                )),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  color: Color.fromRGBO(
                                                      1, 1, 1, 0.35),
                                                  padding: EdgeInsets.only(
                                                      top: 0.009 * height,
                                                      right: 0.06 * width),
                                                  icon: Icon(
                                                      _passwordRegisterVisible1
                                                          ? Icons.visibility
                                                          : Icons
                                                              .visibility_off),
                                                  onPressed: () {
                                                    setState(() {
                                                      _passwordRegisterVisible1 =
                                                          !_passwordRegisterVisible1;
                                                    });
                                                  })
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          minHeight: 0.065 * height),
                                      width: 0.85 * width,
                                      child: Stack(children: [
                                        TextFormField(
                                          keyboardType: TextInputType.text,
                                          controller:
                                              _passwordConfirmController,
                                          validator: (text) {
                                            if (text.isEmpty ||
                                                text !=
                                                    _passwordController.text)
                                              return "Senha Inválida!";
                                          },
                                          obscureText:
                                              !_passwordRegisterVisible2,
                                          decoration: InputDecoration(
                                              labelText: 'Repetir Senha',
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
                                              fontSize: 14.0),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                color: Color.fromRGBO(
                                                    1, 1, 1, 0.35),
                                                padding: EdgeInsets.only(
                                                    top: 0.009 * height,
                                                    right: 0.06 * width),
                                                icon: Icon(
                                                    _passwordRegisterVisible2
                                                        ? Icons.visibility
                                                        : Icons.visibility_off),
                                                onPressed: () {
                                                  setState(() {
                                                    _passwordRegisterVisible2 =
                                                        !_passwordRegisterVisible2;
                                                  });
                                                })
                                          ],
                                        )
                                      ]),
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                    ),
                                    Container(
                                      padding: EdgeInsets.zero,
                                      child: TextButton(
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            Map<String, dynamic> userData = {
                                              "name": _nameController.text,
                                              "email": _emailController.text
                                            };

                                            model.signUP(
                                                userData: userData,
                                                pass: _passwordController.text,
                                                onSuccess: _onSuccess,
                                                onFail: _onFail);
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              side: BorderSide(
                                                  color: Colors.white)),
                                        ),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                            gradient: AppGradients.orangelinear,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: Container(
                                            color: Colors.blue,
                                            height: (height / width) < 2
                                                ? (0.09 * height)
                                                : (0.08 * height),
                                            width: (height / width) < 2
                                                ? (0.6 * width)
                                                : (0.5 * width),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Criar Conta',
                                              style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                      color: Color.fromRGBO(
                                                          239, 48, 48, 0.35),
                                                      offset: Offset(0, 4),
                                                      blurRadius: 4,
                                                    )
                                                  ],
                                                  color: Colors.white,
                                                  fontSize: 23.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))));
            },
          ),
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

  void _onFail() {
    _scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao criar usuário!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
