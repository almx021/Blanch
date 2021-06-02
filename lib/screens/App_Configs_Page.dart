import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/screens/App_Home_Page.dart';
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
    var bottomNavegationBar = Container(
      width: size.width,
      height: size.height * .07,
      color: AppColors.backGroundApp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 80,
                height: 20,
                child: IconButton(
                  icon: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                width: 60,
                height: 20,
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white38,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 17),
                child: Text(
                  'Pesquisa',
                  style: TextStyle(fontSize: 13, color: Colors.white38),
                ),
              )
            ],
          ),
          Container(
            width: 80,
            height: 80,
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.backGroundApp,
                ),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(150)),
                  child: Image.asset(
                    AppImages.newPost,
                    width: 80,
                    height: 80,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/newpost');
                }),
          ),
          Column(
            children: [
              Container(
                width: 60,
                height: 35,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.backGroundApp,
                    ),
                    child: Image.asset(
                      AppImages.emAlta,
                      width: size.width * .1,
                    ),
                    onPressed: () {}),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text(
                  'Em alta',
                  style: TextStyle(fontSize: 12, color: Colors.white38),
                ),
              )
            ],
          ),
          Container(
            width: 80,
            height: 80,
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.backGroundApp,
                ),
                child: Image.asset(
                  AppImages.perfilImage,
                  width: size.width * .1,
                ),
                onPressed: () {}),
          ),
        ],
      ),
    );

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
                                          return (AppGradients.linearteste)
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
                                          return (AppGradients.linearteste)
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
      bottomNavigationBar: bottomNavegationBar,
    );
  }
}
