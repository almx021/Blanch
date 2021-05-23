import 'package:appteste/models/user_model.dart';
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

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          return Stack(
            children: [
              Container(decoration: BoxDecoration(gradient: AppGradients.linear)),
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
                        )
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 125.0, bottom: 30.0),
                          child: Text(
                            'RECUPERAR SENHA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 70.0),
                          child: Text(
                            'Informe o email da sua conta',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),

                        Divider(),

                        Container(
                          padding: EdgeInsets.only(top: 10.0),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            decoration: InputDecoration(
                                labelText: 'Email',
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
                            style: TextStyle(color: Colors.white, fontSize: 17.0),
                          ),
                        ),

                        Divider(),
                        Divider(),

                        Container(
                          padding: EdgeInsets.only(top: 5.0),
                          child: TextButton(
                            onPressed: () {
                              if(_emailController.text.isEmpty) {
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text("Insira seu email"),
                                  backgroundColor: Colors.redAccent,
                                  duration: Duration(seconds: 2),
                                ));
                              }
                              else{
                                model.recoverPassword(_emailController.text);
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text("Confira seu email"),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 2),
                                ));
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
                                  width: 160.0,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Enviar',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 23.0,
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
          );
        }
      )
    );
  }
}
