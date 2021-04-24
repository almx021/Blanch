import 'package:appteste/core/App_Images.dart';
import 'package:flutter/material.dart';

import 'App_Gradients.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _passwordRegisterVisible1;
  bool _passwordRegisterVisible2;

  @override
  void initState() {
    _passwordRegisterVisible1 = false;
    _passwordRegisterVisible2 = false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(gradient: AppGradients.linear)),
          SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(10.0, 60.0, 15.0, 0.0),
              child:  Column(
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
                            'CADASTRAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: 'Seu Nome',
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
                            style: TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),

                        Divider(),

                        Container(
                          padding: EdgeInsets.only(),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: 'Nome de Usuário',
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
                            style: TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),

                        Divider(),

                        Stack(
                          children: [
                            Container(
                              child: TextField(
                                keyboardType: TextInputType.text,
                                obscureText: !_passwordRegisterVisible1,
                                decoration: InputDecoration(
                                    labelText: 'Senha',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    padding: EdgeInsets.all(17.0),
                                    icon: Icon(_passwordRegisterVisible1
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: (){
                                      setState(() {
                                        _passwordRegisterVisible1 = !_passwordRegisterVisible1;
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
                              child: TextField(
                                keyboardType: TextInputType.text,
                                obscureText: !_passwordRegisterVisible2,
                                decoration: InputDecoration(
                                    labelText: 'Repetir Senha',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    padding: EdgeInsets.all(17.0),
                                    icon: Icon(_passwordRegisterVisible2
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: (){
                                      setState(() {
                                        _passwordRegisterVisible2 = !_passwordRegisterVisible2;
                                      });
                                    })
                              ],
                            )
                          ],
                        ),

                        Divider(),
                        Divider(),

                        Container(
                          height: 70.0,
                          width: 250.0,
                          padding: EdgeInsets.only(top: 5.0),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.white)),
                            color: Colors.transparent,
                            onPressed: () {
                            //  Navigator.pop(context);
                            },
                            child: Text(
                              'Criar Conta',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),

                      ],
                    ),


                ],
              ),
              ),



        ],
      ),
    );
  }
}
