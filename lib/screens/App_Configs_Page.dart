import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:flutter/material.dart';

class ConfigsPage extends StatefulWidget {
  @override
  _ConfigsPageState createState() => _ConfigsPageState();
}

class _ConfigsPageState extends State<ConfigsPage> {
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
            icon: Image.asset(AppImages.leftArrow),
          ),
          title: Text(
            'Configurações',
            style: TextStyle(color: Colors.white),
          )),
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(color: AppColors.backGroundApp)),
          SingleChildScrollView(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 64)),
                  Container(
                    width: size.width,
                    height: 80,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.backGroundApp,
                        ),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Row(children: [
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Image.asset(AppImages.notification),
                              ),
                              Text(
                                'Notificação',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/notificacoes');
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Container(
                      width: size.width,
                      height: 80,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.backGroundApp,
                          ),
                          child: Row(children: [
                            Align(
                              child: Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Image.asset(AppImages.accounthd),
                              ),
                            ),
                            Text(
                              'Conta',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ]),
                          onPressed: () {
                            Navigator.pushNamed(context, '/conta');
                          }),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Container(
                      width: size.width,
                      height: 80,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.backGroundApp,
                          ),
                          child: Row(children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Image.asset(AppImages.help),
                            ),
                            Text(
                              'Ajuda',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ]),
                          onPressed: () {
                            Navigator.pushNamed(context, '/ajuda');
                          }),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.backGroundApp,
                        ),
                        child: Row(children: [
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Image.asset(AppImages.sobre),
                          ),
                          Text(
                            'Sobre',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ]),
                        onPressed: () {
                          Navigator.pushNamed(context, '/sobre');
                        }),
                  ),
                  Padding(padding: EdgeInsets.only(top: 64)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  backgroundColor:
                                      Color.fromRGBO(39, 39, 39, 1),
                                  title: Text('Desconectar',
                                      style: TextStyle(color: Colors.white)),
                                  content: Text(
                                      'Tem certeza que deseja se desconectar?',
                                      style: TextStyle(color: Colors.grey)),
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
                                        Navigator.pop(context, 'Sim');
                                      },
                                      child: ShaderMask(
                                        shaderCallback: (Rect rect) {
                                          return (AppGradients.orangelinear)
                                              .createShader(rect);
                                        },
                                        child: Text(
                                          'Sim',
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
                        child: Text(
                          'Sair da Conta',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.blueAccent,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
