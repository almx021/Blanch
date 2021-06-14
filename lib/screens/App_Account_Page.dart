import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:flutter/material.dart';
import '../core/App_Colors.dart';

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.backGroundApp,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(AppImages.leftArrow, width: 25),
          ),
          title: Text(
            'Conta',
            style: TextStyle(color: Colors.white),
          )),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(color: AppColors.backGroundApp),
        ),
        Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 25)),
            Container(
              width: size.width,
              height: 60,
              child: TextButton(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Alterar dados de cadastro",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/AlterarDados');
                },
              ),
            ),
            Container(
              width: size.width,
              height: 60,
              child: TextButton(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Excluir conta",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.red.shade900,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          backgroundColor: Color.fromRGBO(39, 39, 39, 1),
                          title:
                              Text('Tem certeza que deseja excluir sua conta?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 15),
                                  )),
                          content: Padding(
                            padding: EdgeInsets.only(top: size.height * 0.02),
                            child: Container(
                              height: size.height * 0.05,
                              child: TextField(
                                obscureText: true,
                                style: TextStyle(
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 14),
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                    prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            left: 9.0, right: 9.0),
                                        child: Icon(
                                          Icons.lock,
                                          color: Colors.grey,
                                        )),
                                    prefixIconConstraints: BoxConstraints(
                                      minHeight: size.height * 0.02,
                                      minWidth: size.height * 0.02,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(8),
                                    fillColor: Color(0xff444444),
                                    filled: true,
                                    hintStyle: TextStyle(
                                        fontSize: AdaptiveTextSize()
                                            .getadaptiveTextSize(context, 13),
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                    hintText: 'Informe sua senha'),
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'Cancelar');
                              },
                              child: ShaderMask(
                                shaderCallback: (Rect rect) {
                                  return (AppGradients.orangelinear)
                                      .createShader(rect);
                                },
                                child: Text(
                                  'Cancelar',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(20.0))),
                                        backgroundColor: Color.fromRGBO(39, 39, 39, 1),
                                        title:
                                        Text('Sua conta foi excluída',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: AdaptiveTextSize()
                                                  .getadaptiveTextSize(context, 17),
                                            )),
                                        content: Row(
                                          children: [
                                            Text("Sentiremos sua falta",
                                          style: TextStyle(
                                          color: Colors.grey,
                                        )),
                                           Text(" ☹",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: AdaptiveTextSize()
                                                      .getadaptiveTextSize(context, 20),
                                                )),
                                        ]
                                      ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, 'Cancelar');
                                            },
                                            child: ShaderMask(
                                              shaderCallback: (Rect rect) {
                                                return (AppGradients.orangelinear)
                                                    .createShader(rect);
                                              },
                                              child: Text(
                                                'Voltar ao inicio',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    .copyWith(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: ShaderMask(
                                shaderCallback: (Rect rect) {
                                  return (AppGradients.orangelinear)
                                      .createShader(rect);
                                },
                                child: Text(
                                  'Excluir',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
