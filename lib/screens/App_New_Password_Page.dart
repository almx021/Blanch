import 'package:appteste/core/App_Logos.dart';
import 'package:flutter/material.dart';

import '../core/App_Gradients.dart';
import '../core/App_Images.dart';

class NewPasswordPage extends StatefulWidget {
  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  bool _passwordRegisterVisible1;
  bool _passwordRegisterVisible2;

  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    _passwordRegisterVisible1 = false;
    _passwordRegisterVisible2 = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scaffoldMessengerKey.currentState.showSnackBar(
        SnackBar(
            content: Text("Insira a nova senha"),
            backgroundColor: Colors.greenAccent,
            duration: Duration(seconds: 2)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {},
      child: ScaffoldMessenger(
          key: _scaffoldMessengerKey,
          child: Scaffold(
              body: Form(
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
                                0.05 * width, 0.26 * height, 0.05 * width, 0.0),
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: height * 0.09),
                                      child: Text(
                                        'CADASTRAR NOVA SENHA',
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
                                      child: Stack(
                                        children: [
                                          TextFormField(
                                            controller: _passwordController,
                                            // ignore: missing_return
                                            validator: (text) {
                                              if (text.isEmpty)
                                                return "Senha Inválida!";
                                              if (text.length < 6)
                                                return "Senha Inválida! Mínimo de 6 Dígitos!";
                                            },
                                            keyboardType: TextInputType.text,
                                            obscureText:
                                                !_passwordRegisterVisible1,
                                            decoration: InputDecoration(
                                                labelText: 'Nova Senha',
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
                                          // ignore: missing_return
                                          validator: (text) {
                                            if (text.isEmpty)
                                              return "Confirme a Nova Senha";
                                            if (text.length < 6)
                                              return "Senha Inválida! Mínimo de 6 Dígitos!";
                                            if (text !=
                                                _passwordController.text)
                                              return "Senhas Diferentes. Tente Novamente.";
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
                                    Padding(
                                        padding:
                                            EdgeInsets.only(top: 0.04 * height),
                                        child: Container(
                                            height: 65.0,
                                            width: 215.0,
                                            child: TextButton(
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.zero,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                      side: BorderSide(
                                                          color: Colors.white)),
                                                ),
                                                child: Ink(
                                                    decoration: BoxDecoration(
                                                      gradient: AppGradients
                                                          .orangelinear,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                    child: Container(
                                                      height: 65.0,
                                                      width: 215.0,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        'Redefinir senha',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                    )),
                                                onPressed: () {
                                                  _formKey.currentState
                                                      .validate();
                                                })))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )))))),
    );
  }
}
