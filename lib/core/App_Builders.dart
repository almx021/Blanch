import 'dart:async';

import 'package:appteste/screens/App_Perfil_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appteste/core/App_Variables.dart';

import 'App_Colors.dart';
import 'App_Images.dart';

class Builders {
  static Widget buildMiniLogo(BuildContext context, double screenWidth,
      double screenHeight, String logo) {
    return Padding(
        padding:
            EdgeInsets.only(top: 0.08 * screenWidth, left: 0.03 * screenWidth),
        child: Container(
            constraints: BoxConstraints(
                minWidth: 0.175 * screenWidth, minHeight: 0.175 * screenHeight),
            child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.transparent)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      logo,
                      width: 0.165 * screenWidth,
                      height: 0.165 * screenWidth,
                    ),
                    Text("BLANCH",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: (screenWidth * screenHeight) < 190000.0
                                ? 19.0
                                : 21.0,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                  color: Colors.blueGrey[900],
                                  offset: Offset(0.3, 0.5),
                                  blurRadius: 1.5)
                            ])),
                  ],
                ))));
  }

  static Widget buildBottomNavBar({
    BuildContext context,
    String type,
    double height,
    double width,
    User user,
    selectedImage,
    FutureOr onGoBack,
  }) {
    //quando chamar vai chamar context: context, type: "home", height: size.height, width: size.width, user: user,
    // selectedImage: selectedImage, onGoBack: onGoBack
    /*return Align(
        alignment: Alignment.bottomLeft,
        child: SizedBox(
          height: height * (60 / 843),
          child: Container(
            width: width,
            height: height * .07,
            color: AppColors.backGroundApp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding:
                    EdgeInsets.only(right: width * 0.034 / 2)),
                Container(
                  width: width * (60 / 411),
                  height: height * (60 / 843),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            type == "home" ? AppImages.homeSelected : AppImages.homepage,
                            width: width * (30 / 411),
                            height: height * (30 / 843),
                            //width: size.width * .1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                                fontSize: 11, color: type == "home" ? Colors.white : Colors.white38),
                          ),
                        ],
                      ),
                      onPressed: () {
                        if(type != "home") {
                          Navigator.pushNamed(context, '/home');
                        }
                      }),
                ),
                Padding(
                    padding: EdgeInsets.only(left: width * 0.034)),
                Container(
                  width: width * (70 / 411),
                  height: height * (60 / 843),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            AppImages.searchIcon,
                            width: width * (30 / 411),
                            height: height * (30 / 843),
                            color: type == "search" ? Colors.white : Colors.white38
                            //width: size.width * .1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                          ),
                          Text(
                            'Pesquisa',
                            style: TextStyle(
                                fontSize: 11,
                                color: type == "search" ? Colors.white : Colors.white38),
                          ),
                        ],
                      ),
                      onPressed: () {
                        //print((postSnapshot.docs[1].data as Map)['user']);
                      }),
                ),
                Padding(
                    padding: EdgeInsets.only(left: width * 0.034)),
                Container(
                  width: width * 0.19,
                  height: height * 0.095,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150)),
                        child: Image.asset(
                          AppImages.newPost,
                          width: width * 0.097,
                          height: height * 0.047,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/newpost');
                      }),
                ),
                Padding(
                    padding: EdgeInsets.only(left: width * 0.034)),
                Container(
                  width: width * (60 / 411),
                  height: height * (60 / 843),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            AppImages.emAlta,
                            width: width * (30 / 411),
                            height: height * (30 / 843),
                            color: type == "emAlta" ? Colors.white : Colors.white38
                            //width: size.width * .1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                          ),
                          Text(
                            'Em alta',
                            style: TextStyle(
                                fontSize: 11,
                                color: type == "emAlta" ? Colors.white : Colors.white38),
                          ),
                        ],
                      ),
                      onPressed: () {
                        if(type != "emAlta") {
                          Navigator.pushNamed(context, '/emAlta');
                        }

                      }),
                ),
                Padding(
                    padding: EdgeInsets.only(left: width * 0.034)),
                Container(
                  width: width * 0.19,
                  height: height * 0.095,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: CircleAvatar(
                        backgroundImage: selectedImage == null
                            ? user.photoURL == null
                            ? AssetImage(AppImages.perfilImage)
                            : NetworkImage(
                          user.photoURL,
                        )
                            : FileImage(selectedImage),
                      ),
                      onPressed: () {
                        if(type != "perfil") {
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: (context) => PerfilPage(),
                            ),
                          ).then((value) => onGoBack);
                        }
                      }),
                ),
              ],
            ),
          ),
        )
    ); */
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: width,
        height: height * .07,
        color: AppColors.backGroundApp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(right: width * 0.034 / 2)),
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      width: width * 0.146,
                      height: height * 0.047,
                      child: Image.asset(
                        type == "home"
                            ? AppImages.homeSelected
                            : AppImages.homepage,
                        width: width * 0.19, height: height * 0.095,
                        //width: size.width * .1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 10,
                            color:
                                type == "home" ? Colors.white : Colors.white38),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  if (type != "home") {
                    Navigator.pushNamed(context, '/home');
                  }
                }),
            Padding(padding: EdgeInsets.only(left: width * 0.034)),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    width: width * 0.146,
                    height: height * 0.047,
                    child: Image.asset(
                      AppImages.searchIcon,
                      width: width * 0.19,
                      height: height * 0.095,
                      color: type == "search" ? Colors.white : Colors.white38,
                      //width: size.width * .1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Text(
                      'Pesquisa',
                      style: TextStyle(
                          fontSize: 10,
                          color:
                              type == "search" ? Colors.white : Colors.white38),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/searchPage');
              },
            ),
            Padding(padding: EdgeInsets.only(left: width * 0.034)),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Container(
                padding: EdgeInsets.all(8),
                width: width * 0.19,
                height: height * 0.095,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(150)),
                  child: Image.asset(
                    AppImages.newPost,
                    width: width * 0.097,
                    height: height * 0.047,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/newpost');
              },
            ),
            Padding(padding: EdgeInsets.only(left: width * 0.034)),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    width: width * 0.146,
                    height: height * 0.047,
                    child: Image.asset(
                      AppImages.emAlta,
                      width: width * 0.19,
                      height: height * 0.095,
                      color: type == "emAlta" ? Colors.white : Colors.white38,
                      //width: size.width * .1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Text(
                      'Em alta',
                      style: TextStyle(
                          fontSize: 10,
                          color:
                              type == "emAlta" ? Colors.white : Colors.white38),
                    ),
                  )
                ],
              ),
              onTap: () {
                if (type != "emAlta") {
                  Navigator.pushNamed(context, '/emAlta');
                }
              },
            ),
            Padding(padding: EdgeInsets.only(left: width * 0.034)),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Container(
                padding: EdgeInsets.all(8),
                width: width * 0.19,
                height: height * 0.095,
                child: CircleAvatar(
                  backgroundImage: selectedImage == null
                      ? user.photoURL == null
                          ? AssetImage(AppImages.perfilImage)
                          : NetworkImage(
                              user.photoURL,
                            )
                      : FileImage(selectedImage),
                ),
              ),
              onTap: () {
                if (type != "perfil") {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => PerfilPage(),
                        ),
                      )
                      .then((value) => onGoBack);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
