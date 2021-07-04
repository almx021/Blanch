import 'dart:async';

import 'package:appteste/core/App_Builders.dart';
import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/core/App_Variables.dart';
import 'package:appteste/models/post_model.dart';
import 'package:appteste/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'App_Home_Page.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;
  FirePost firePost = FirePost();
  QuerySnapshot postSnapshot;

  User user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirePost.getData().then((result) {
      setState(() {
        postSnapshot = result;
      });
    });
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;

    Widget buildCircleAvatar(double radius) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: selectedImage == null
            ? user.photoURL == null
                ? AssetImage(AppImages.perfilImage)
                : NetworkImage(
                    user.photoURL,
                  )
            : FileImage(selectedImage),
      );
    }

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
            '${user.displayName}',
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
            padding: EdgeInsets.only(bottom: 100),
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
                          padding:
                              EdgeInsets.only(right: widthScreen * 0.5 - 50),
                        ),
                        buildCircleAvatar(50),
                        Padding(
                          padding: EdgeInsets.only(
                            left: widthScreen * 0.24,
                          ),
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
                              Navigator.pushNamed(context, '/editarPerfil')
                                  .then((value) => onGoBack(value));
                            })
                      ])),
              Padding(padding: EdgeInsets.only(top: 12)),
              Text(
                FireAuth.userData != null
                    ? '@${FireAuth.userData["username"]}'
                    : '@null',
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
                    TextButton(
                      onPressed: () {},
                      child: Column(children: [
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
                    ),
                    VerticalDivider(
                      color: Colors.white38,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Seguidores');
                      },
                      child: Column(children: [
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
                    ),
                    VerticalDivider(
                      color: Colors.white38,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Seguindo');
                      },
                      child: Column(children: [
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
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                color: Colors.white38,
              ),
              Container(
                child: Column(
                  children: [
                    postSnapshot != null
                        ? ListView.builder(
                      reverse: true,
                      itemCount: postSnapshot.docs.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if(postSnapshot.docs[index]['uidUser'] == user.uid){
                          return PostTile(
                            imageURL: postSnapshot.docs[index]['imageURL'],
                            postID: postSnapshot.docs[index].id,
                            user: postSnapshot.docs[index]['user'],
                            descricaoDaReceita: postSnapshot.docs[index]['descricaoDaReceita'],
                            useruid: user.uid,
                            username: postSnapshot.docs[index]['username'],
                            userPhotoURL: postSnapshot.docs[index]['userImage'],
                            currentPage: "perfilPage",
                          );
                        }
                        return Container();
                      },
                    )
                        : Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
          Builders.buildBottomNavBar(
            context: context,
            type: "perfil",
            height: size.height,
            width: size.width,
            user: user,
            selectedImage: selectedImage,
            onGoBack: onGoBack,
          )
        ],
      ),

      // Barra Inferior:
    );
  }
}
