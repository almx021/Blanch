import 'package:appteste/core/App_Logos.dart';
import 'package:flutter/material.dart';

import '../core/App_Gradients.dart';
import '../core/App_Images.dart';

class InsertCodePage extends StatefulWidget {
  @override
  _InsertCodePageState createState() => _InsertCodePageState();
}

class _InsertCodePageState extends State<InsertCodePage> {
  final _codeController = TextEditingController(text: "");

  final _focusCode = FocusNode();

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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        _focusCode.unfocus();
      },
      child: ScaffoldMessenger(
          key: _scaffoldMessengerKey,
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                    decoration: BoxDecoration(gradient: AppGradients.linear)),
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
                              'INSERIR CÓDIGO DE CONFIRMAÇÃO',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: width <= 335
                                    ? 17.0
                                    : width <= 375
                                        ? 18.0
                                        : 20.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 0.08 * height,
                                left: 0.10 * width,
                                right: 0.10 * width),
                            child: Text(
                              'Insira o código de confirmação que foi enviado para o email.',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          Divider(color: Colors.transparent),
                          Container(
                            padding: EdgeInsets.only(
                                top: 0.02 * height,
                                left: width < 360 ? 0.09 * width : 0.1 * width,
                                right:
                                    width < 360 ? 0.09 * width : 0.1 * width),
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
                            padding: EdgeInsets.only(top: 5.0),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(color: Colors.white)),
                              ),
                              onPressed: () async {
                                _focusCode.unfocus();
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
                                  decoration: BoxDecoration(
                                    gradient: AppGradients.orangelinear,
                                    borderRadius: BorderRadius.circular(50.0),
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
                          Padding(
                            padding: EdgeInsets.only(top: 0.029 * height),
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
            ),
          )),
    );
  }
}
