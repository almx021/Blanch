import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'App_Gradients.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(gradient: AppGradients.linear)),
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Image.asset(
                  AppImages.logo,
                  width: 150,
                  height: 150,
                ),
                Text("BLANCH",
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 60,
                      color: Colors.white,
                    )),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
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
                Stack(
                  children: [
                    Container(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        obscureText: !_passwordVisible,
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
                            icon: Icon(_passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: (){
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            })
                      ],
                    )
                  ],
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/recover');
                      },
                      child: Text(
                        'Recuperar senha',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  ],
                )),
                Container(
                  height: 70.0,
                  width: 150.0,
                  padding: EdgeInsets.only(top: 5.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.white)),
                    color: Colors.transparent,
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Divider(),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '________________  ',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                    Text(
                      'OU',
                      style: TextStyle(color: Colors.white, fontSize: 17.0),
                    ),
                    Text(
                      '  _________________',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ],
                )),
                Divider(),
                Container(
                  height: 70.0,
                  width: 240.0,
                  padding: EdgeInsets.only(top: 10.0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                  child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.white)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: Container(
                              child: Image.asset(
                                AppImages.iconGoogle,
                                height: 45.0,
                                width: 45.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Text(
                              'Entrar com o google',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text(
                        'Não tem uma conta?',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      padding: EdgeInsets.only(top: 30.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        color: Colors.transparent,
                        child: Text(
                          ' Cadastre-se',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
