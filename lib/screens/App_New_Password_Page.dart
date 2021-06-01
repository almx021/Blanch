import 'package:appteste/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _passwordRegisterVisible1 = false;
    _passwordRegisterVisible2 = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
            content: Text("Insira a nova senha"),
            backgroundColor: Colors.greenAccent,
            duration: Duration(seconds: 2)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(color: Colors.transparent)),
                            ),
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
                              padding: EdgeInsets.only(top: 70.0, bottom: 30.0),
                              child: Text(
                                'CADASTRAR NOVA SENHA',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                            Divider(color: Colors.transparent),
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
                                        labelText: 'Nova Senha',
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
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600),
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
                            Divider(color: Colors.transparent),
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
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600),
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
                            Divider(color: Colors.transparent),
                            Container(
                                height: 70.0,
                                width: 220.0,
                                padding: EdgeInsets.only(top: 5.0),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          side:
                                              BorderSide(color: Colors.white)),
                                    ),
                                    child: Ink(
                                        decoration: BoxDecoration(
                                          gradient: AppGradients.linearteste,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        child: Container(
                                          height: 70.0,
                                          width: 220.0,
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Redefinir senha',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        )),
                                    onPressed: () {}
                                ))
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

}
