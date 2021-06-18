import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:scoped_model/scoped_model.dart';

class PerfilPage extends StatefulWidget {
  final User user;

  const PerfilPage({this.user});

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {

  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backGroundApp,
      appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: AppColors.backGroundApp,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(AppImages.leftArrow, width: 25),
          ),
          title: Text(
            '${_currentUser.displayName}',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Container(
              width: 60,
              height: 80,
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.backGroundApp,
                  ),
                  child: Icon(
                    Icons.bookmarks_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/itensSalvos');
                  }),
            ),
          ]),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.backGroundApp),
          ),
          SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 25),
              ),
              Container(
                  width: widthScreen,
                  height: heightScreen / 8,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: widthScreen * 0.5 - 50),
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            AppImages.perfilImage,
                          ),
                        ),
                        Padding(
                          padding :EdgeInsets.only(left: widthScreen * 0.24,),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: AppColors.backGroundApp,
                                minimumSize: Size.fromWidth(0)),
                            child: Image.asset(
                              AppImages.editPerfil,
                              width: widthScreen * 0.073,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/editarPerfil');})
                      ])),
              Padding(padding: EdgeInsets.only(top: 12)),
              Text(

                '@',
                style: TextStyle(color: Colors.white),
              ),
              Padding(padding: EdgeInsets.only(top: 12)),
              Text(
                "bio",
                style: TextStyle(color: Colors.white),
              ),
              Padding(padding: EdgeInsets.only(top: 6)),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                      Text(
                        '0', //'${model.userData["postagens"]}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'postagens',
                        style: TextStyle(
                            color: Colors.white38,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
                    VerticalDivider(
                      color: Colors.white38,
                    ),
                    Column(children: [
                      Text(
                        '0', //'${model.userData["seguidores"]}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'seguidores',
                        style: TextStyle(
                            color: Colors.white38,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
                    VerticalDivider(
                      color: Colors.white38,
                    ),
                    Column(children: [
                      Text(
                        '0', //'${model.userData["seguindo"]}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'seguindo',
                        style: TextStyle(
                            color: Colors.white38,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
                  ],
                ),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                color: Colors.white38,
              ),
            ]),
          ),

          Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: heightScreen*(60/843),
                child: Container(
                  width: size.width,
                  height: size.height * .07,
                  color: AppColors.backGroundApp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding( padding: EdgeInsets.only(right: size.width * 0.034/2) ),
                      Container(
                        width: size.width*(60/411),
                        height: size.height*(60/843),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.backGroundApp,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  AppImages.homepage,
                                  width: size.width*(30/411),
                                  height: size.height*(30/843),
                                  //width: size.width * .1,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top:0),
                                ),
                                Text(
                                  'Home',
                                  style: TextStyle(fontSize: 11, color: Colors.white38),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            }),

                      ),
                      Padding( padding: EdgeInsets.only(left: size.width * 0.034) ),
                      Container(
                        width: widthScreen*(70/411),
                        height: heightScreen*(60/843),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:AppColors.backGroundApp,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  AppImages.searchIcon,
                                  width: widthScreen*(30/411),
                                  height: heightScreen*(30/843),
                                  //width: size.width * .1,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top:0),
                                ),
                                Text(
                                  'Pesquisa',
                                  style: TextStyle(fontSize: 11, color: Colors.white38),
                                ),
                              ],
                            ),
                            onPressed: () {

                            }),

                      ),
                      Padding( padding: EdgeInsets.only(left: size.width * 0.034) ),
                      Container(
                        width: size.width * 0.19,
                        height: size.height * 0.095,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.backGroundApp,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(150)),
                              child: Image.asset(
                                AppImages.newPost,
                                width: size.width * 0.097,
                                height: size.height * 0.047,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/newpost');
                            }),
                      ),
                      Padding( padding: EdgeInsets.only(left: size.width * 0.034) ),

                      Container(
                        width: size.width*(60/411),
                        height: size.height*(60/843),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.backGroundApp,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  AppImages.emAlta,
                                  width: size.width*(30/411),
                                  height: size.height*(30/843),
                                  //width: size.width * .1,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top:0),
                                ),
                                Text(
                                  'Em alta',
                                  style: TextStyle(fontSize: 11, color: Colors.white38),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/emAlta');
                            }),

                      ),


                      Padding( padding: EdgeInsets.only(left: size.width * 0.034) ),
                      Container(
                        width: size.width * 0.19,
                        height: size.height * 0.095,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.backGroundApp,
                            ),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                AppImages.perfilImage,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/perfil');
                            }),
                      ),
                    ],
                  ),
                ),
              )
          )
        ],
      ),

      // Barra Inferior:
    );
  }
}
