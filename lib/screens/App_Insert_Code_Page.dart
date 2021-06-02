import 'package:appteste/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../core/App_Gradients.dart';
import '../core/App_Images.dart';

class InsertCodePage extends StatefulWidget {
  @override
  _InsertCodePageState createState() => _InsertCodePageState();
}

class _InsertCodePageState extends State<InsertCodePage> {
  final _codeController = TextEditingController(text: "");

  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scaffoldMessengerKey.currentState.showSnackBar(
        SnackBar(
            content: Text("Confira seu email"),
            backgroundColor: Colors.greenAccent,
            duration: Duration(seconds: 2)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: _scaffoldMessengerKey,
        child: Scaffold(body:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          return Stack(
            children: [
              Container(
                  decoration: BoxDecoration(gradient: AppGradients.linear)),
              SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 0.0),
                child: Column(
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.transparent))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 5.0),
                              child: Container(
                                child: Image.asset(
                                  AppImages.logo,
                                  height: 65,
                                  width: 65,
                                ),
                              ),
                            ),
                            Text(
                              'BLANCH',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w100),
                            ),
                          ],
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 50.0, bottom: 15.0),
                          child: Text(
                            'INSERIR CÓDIGO DE CONFIRMAÇÃO',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Text(
                            'Insira o código de confirmação que foi enviado para o email.',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Divider(color: Colors.transparent),
                        Container(
                          padding: EdgeInsets.only(top: 10.0),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: _codeController,
                            decoration: InputDecoration(
                                labelText: 'Código de Confirmação',
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
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Divider(color: Colors.transparent),
                        Container(
                          height: 70,
                          width: 150,
                          padding: EdgeInsets.only(top: 5.0),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: Colors.white)),
                              ),
                              onPressed: () {
                                if (_codeController.text.isEmpty) {
                                  _scaffoldMessengerKey.currentState
                                      .showSnackBar(SnackBar(
                                    content: Text("Insira o código"),
                                    backgroundColor: Colors.redAccent,
                                    duration: Duration(seconds: 2),
                                  ));
                                } else {
                                  Navigator.pushNamed(context, '/newPassword');
                                }
                              },
                              child: Ink(
                                height: 70,
                                width: 150,
                                decoration: BoxDecoration(
                                  gradient: AppGradients.linearteste,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Enviar',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 17.5),
                          child: Text(
                            'Não recebi email',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        })));
  }
}
