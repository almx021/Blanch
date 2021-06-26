import 'dart:async';

import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/core/App_Variables.dart';
import 'package:appteste/models/post_model.dart';
import 'package:appteste/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

import 'App_Account_Page.dart';
import 'App_Perfil_Page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user = FirebaseAuth.instance.currentUser;

  FirePost firePost = FirePost();
  QuerySnapshot postSnapshot;

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  Widget PostList() {
    return Container(
      child: Column(
        children: [
          postSnapshot != null
              ? ListView.builder(
                  itemCount: postSnapshot.docs.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PostTile(
                      imageURL: postSnapshot.docs[index]['imageURL'],
                      user: postSnapshot.docs[index]['user'],
                      descricaoDaReceita: postSnapshot.docs[index]
                          ['descricaoDaReceita'],
                    );
                  },
                )
              : Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
        ],
      ),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundApp,
        automaticallyImplyLeading: false,
        title: Image.asset(
          AppImages.textLogo,
          width: size.width * 0.30,
        ),
        actions: [
          Container(
            width: 55,
            height: 80,
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.backGroundApp,
                ),
                child: Image.asset(
                  AppImages.notification,
                  width: size.width * 0.06,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/atividades');
                }),
          ),
          Container(
            width: 55,
            height: 80,
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.backGroundApp,
                ),
                child: Image.asset(
                  AppImages.chatApp,
                  width: size.width * .06,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/chat');
                }),
          ),
          Container(
            width: 55,
            height: 80,
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.backGroundApp,
                ),
                child: Image.asset(
                  AppImages.settingsApp,
                  width: size.width * .06,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/configs');
                }),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.backGroundApp),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        color: AppColors.backGroundApp,
                        width: size.width,
                        height: size.height,
                        // child: Image.asset(AppImages.novoPost),
                      ),
                      PostList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: size.height * (60 / 843),
                child: Container(
                  width: size.width,
                  height: size.height * .07,
                  color: AppColors.backGroundApp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(right: size.width * 0.034 / 2)),
                      Container(
                        width: size.width * (60 / 411),
                        height: size.height * (60 / 843),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.backGroundApp,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  AppImages.homeSelected,
                                  width: size.width * (30 / 411),
                                  height: size.height * (30 / 843),
                                  //width: size.width * .1,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                ),
                                Text(
                                  'Home',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            }),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: size.width * 0.034)),
                      Container(
                        width: size.width * (70 / 411),
                        height: size.height * (60 / 843),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.backGroundApp,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  AppImages.searchIcon,
                                  width: size.width * (30 / 411),
                                  height: size.height * (30 / 843),
                                  //width: size.width * .1,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                ),
                                Text(
                                  'Pesquisa',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white38),
                                ),
                              ],
                            ),
                            onPressed: () {
                              print((postSnapshot.docs[1].data as Map)['user']);
                            }),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: size.width * 0.034)),
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
                      Padding(
                          padding: EdgeInsets.only(left: size.width * 0.034)),
                      Container(
                        width: size.width * (60 / 411),
                        height: size.height * (60 / 843),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.backGroundApp,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  AppImages.emAlta,
                                  width: size.width * (30 / 411),
                                  height: size.height * (30 / 843),
                                  //width: size.width * .1,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                ),
                                Text(
                                  'Em alta',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white38),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/emAlta');
                            }),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: size.width * 0.034)),
                      Container(
                        width: size.width * 0.19,
                        height: size.height * 0.095,
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
                              Navigator.of(context)
                                  .push(
                                    MaterialPageRoute(
                                      builder: (context) => PerfilPage(),
                                    ),
                                  )
                                  .then((value) => onGoBack(value));
                            }),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
      // Barra Inferior:
    );
  }
}

class PostTile extends StatelessWidget {
  String descricaoDaReceita;
  String user;
  String imageURL;

  PostTile({@required this.imageURL, this.descricaoDaReceita, this.user});

  int curtidas = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      color: AppColors.backGroundApp,
      child: Column(
        children: [
          Divider(),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.03, bottom: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Align(
                      child: CircleAvatar(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.025),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                user,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 15)),
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.015),
                                  child: Text(
                                    'Nova receita!',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AdaptiveTextSize()
                                            .getadaptiveTextSize(context, 14)),
                                  )),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GradientText(
                              '@usuário',
                              gradient: AppGradients.linear,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context, 15)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(right: size.width * 0.02),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          onTap: () {}),
                    )),
              ],
            ),
          ),
          Container(
            height: size.height * .25,
            width: size.width,
            child: Image.network(
              imageURL,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01,
                left: size.width * 0.02,
                right: size.width * 0.02,
                bottom: size.height * 0.003),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text('Curtido por ${curtidas} pessoas',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 16.5))),
                ),
                GradientText(
                  '  #Salgado #Tag1 #Tag2',
                  gradient: AppGradients.linear,
                  style: TextStyle(
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 15)),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.02, top: size.height * 0.004),
                  child: Expanded(
                    child: Wrap(
                      children: [
                        Text(
                          '${user}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 16)),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: size.width * 0.015)),
                        Flexible(
                          child: Text(
                            '${descricaoDaReceita}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AdaptiveTextSize()
                                    .getadaptiveTextSize(context, 16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.015),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      child: Icon(
                        Icons.bookmarks_outlined,
                        color: Colors.white,
                      ),
                      onTap: () {}),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.02, top: size.height * 0.005),
            child: Row(
              children: [
                Text(
                  '@usuário',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 14.5)),
                ),
                Padding(padding: EdgeInsets.only(left: size.width * 0.015)),
                Text(
                  'Muito bom!',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 14.5)),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'Ver mais',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 15)),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: size.width * 0.02, bottom: size.height * 0.02),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Publicado 15 minutos atrás',
                style: TextStyle(
                    color: Colors.white38,
                    fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 15)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
