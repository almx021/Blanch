import 'package:appteste/core/App_Images.dart';
import 'package:appteste/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _passwordRegisterVisible1 = false;
    _passwordRegisterVisible2 = false;
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return Form(
              key: _formKey,
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(gradient: AppGradients.linear)),
                  SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 0.0),
                    child: Column(
                      children: [
                        FlatButton(
                            color: Colors.transparent,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.transparent)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 5.0),
                                  child: Container(
                                    child: Image.asset(
                                      AppImages.logo,
                                      height: 65.0,
                                      width: 65.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: Text(
                                    'BLANCH',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w100),
                                  ),
                                )
                              ],
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(top: h * 0.075, bottom: h* 0.025),
                              child: Text(
                                'CADASTRAR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20.0),
                              child: TextFormField(
                                controller: _nameController,
                                validator: (text) {
                                  if (text.isEmpty) return "Nome Inválido!";
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: 'Seu Nome',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    )),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            ),
                            Divider(),
                            Container(
                              padding: EdgeInsets.only(),
                              child: TextFormField(
                                controller: _emailController,
                                validator: (text) {
                                  if (text.isEmpty || !text.contains("@"))
                                    return "Email Inválido!";
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    )),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            ),
                            Divider(),
                            Stack(
                              children: [
                                Container(
                                  child: TextFormField(
                                    controller: _passwordController,
                                    validator: (text) {
                                      if (text.isEmpty || text.length < 6)
                                        return "Senha Inválida!";
                                    },
                                    keyboardType: TextInputType.text,
                                    obscureText: !_passwordRegisterVisible1,
                                    decoration: InputDecoration(
                                        labelText: 'Senha',
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
                                        color: Colors.white, fontSize: 17.0),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        padding: EdgeInsets.all(17.0),
                                        icon: Icon(_passwordRegisterVisible1
                                            ? Icons.visibility
                                            : Icons.visibility_off),
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
                            Divider(),
                            Stack(
                              children: [
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _passwordConfirmController,
                                    validator: (text) {
                                      if (text.isEmpty ||
                                          text != _passwordController.text)
                                        return "Senha Inválida!";
                                    },
                                    obscureText: !_passwordRegisterVisible2,
                                    decoration: InputDecoration(
                                        labelText: 'Repetir Senha',
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
                                        color: Colors.white, fontSize: 17.0),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        padding: EdgeInsets.all(17.0),
                                        icon: Icon(_passwordRegisterVisible2
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
                              ],
                            ),
                            Divider(),
                            Divider(),
                            Container(
                              padding: EdgeInsets.only(top: 5.0),
                              child: TextButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
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
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(color: Colors.white)),
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    gradient: AppGradients.linearteste,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Container(
                                    height: 60.0,
                                    width: 200.0,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Criar Conta',
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              color: Color.fromRGBO(239, 48, 48, 0.35),
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
              ));
        },
      ),
    );
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário criado com sucesso!"),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao criar usuário!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
