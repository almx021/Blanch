import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/screens/App_Home_Page.dart';
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
                child:  IconButton(
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
                child: Text('Home',
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
                child: Text('Pesquisa',
                  style: TextStyle(fontSize: 13, color: Colors.white38),
                ),
              )
            ],
          ),
          Container(
            width: 80,
            height: 80,
            child: FlatButton(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(150)),
                  child: Image.asset(
                    AppImages.newPost,
                    width: 80,
                    height: 80,
                  ),),
                color: AppColors.backGroundApp,
                onPressed: () {
                  Navigator.pushNamed(context, '/newpost');
                }),
          ),
          Column(
            children: [
              Container(
                width: 60,
                height: 35,
                child: FlatButton(
                    child: Image.asset(
                      AppImages.emAlta,
                      width: size.width * .1,
                    ),
                    color: AppColors.backGroundApp,
                    onPressed: () {}),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text('Em alta',
                  style: TextStyle(fontSize: 12, color: Colors.white38),
                ),
              )
            ],
          ),
          Container(
            width: 80,
            height: 80,
            child: FlatButton(
                child: Image.asset(
                  AppImages.perfilImage,
                  width: size.width * .1,
                ),
                color: AppColors.backGroundApp,
                onPressed: () {}),
          ),

        ],
      ),
    )  ;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backGroundApp,
        title: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(right: 20),
                child: IconButton(
                  onPressed:() {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(AppImages.leftArrow),
                )
            ),
          Text('Configurações',
            style: TextStyle(color: Colors.white),
          )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(color: AppColors.backGroundApp),),

              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 64)),
                  Container(
                    width: size.width,
                    height: 80,
                    child: FlatButton(
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Row(
                                children: [

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

                                ]
                            ),
                          ),
                        ),
                        color: AppColors.backGroundApp,
                        onPressed: () {}),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Container(
                      width: size.width,
                      height: 80,
                      child: FlatButton(
                          child: Row(
                              children: [

                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Image.asset(AppImages.privacy),
                                ),
                                Text(
                                  'Privacidade',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),

                              ]
                          ),
                          color: AppColors.backGroundApp,
                          onPressed: () {}),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Container(
                      width: size.width,
                      height: 80,
                      child: FlatButton(
                          child: Row(
                              children: [

                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Image.asset(AppImages.security),
                                ),

                                Text(
                                  'Segurança',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),

                              ]
                          ),
                          color: AppColors.backGroundApp,
                          onPressed: () {}),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Container(
                      width: size.width,
                      height: 80,
                      child: FlatButton(
                          child: Row(
                              children: [

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

                              ]
                          ),
                          color: AppColors.backGroundApp,
                          onPressed: () {}),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: FlatButton(
                        child: Row(
                            children: [

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

                            ]
                        ),
                        color: AppColors.backGroundApp,
                        onPressed: () {}),
                  ),

                  Padding(padding: EdgeInsets.only(top: 64)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '');
                        },
                        child: Text(
                          'Sair da Conta',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

        ],
      ),

        bottomNavigationBar: bottomNavegationBar,
    );
  }
}