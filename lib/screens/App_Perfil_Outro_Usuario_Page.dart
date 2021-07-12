import 'dart:async';

import 'package:appteste/core/App_Builders.dart';
import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/core/App_Variables.dart';
import 'package:appteste/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'App_Account_Page.dart';
import 'App_Home_Page.dart';

class PerfilOutroUsuarioPage extends StatefulWidget {

  final String name;
  final String foto;
  final String nomedeusuario;
  final String uidUsuario;

  const PerfilOutroUsuarioPage({Key key, @required this.name, @required this.foto, @required this.nomedeusuario, @required this.uidUsuario}) : super(key: key);

  @override
  _PerfilOutroUsuarioPageState createState() => _PerfilOutroUsuarioPageState();
}

class _PerfilOutroUsuarioPageState extends State<PerfilOutroUsuarioPage> {
  bool pressGeoON = false;
  bool cmbscritta = false;
  //botei isso aq so p apresentar no video mesmo ja q n vai colar fzr os seguidores
  int followers = 0;
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
          widget.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
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
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              widget.foto),
                        ),
                      ])),
              Padding(padding: EdgeInsets.only(top: 12)),
              Text(
                '@${widget.nomedeusuario}',
                style: TextStyle(color: Colors.white),
              ),
              Padding(padding: EdgeInsets.only(top: 12)),
              Text(
                "bio",
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.02),
                child: Container(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        pressGeoON = !pressGeoON;
                        cmbscritta = !cmbscritta;
                        followers = 1;
                      });
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.white10)),
                    ),
                    child: Ink(
                        decoration: BoxDecoration(
                          gradient: pressGeoON
                              ? AppGradients.orangelinear
                              : LinearGradient(colors: [
                                  Color(0xff282828),
                                  Color(0xff282828)
                                ]),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          height: 0.05 * size.height,
                          width: 0.35 * size.width,
                          alignment: Alignment.center,
                          child: cmbscritta
                              ? Text(
                                  "Seguindo",
                                  style: TextStyle(
                                      fontSize: AdaptiveTextSize()
                                          .getadaptiveTextSize(context, 14),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  "Seguir",
                                  style: TextStyle(
                                      fontSize: AdaptiveTextSize()
                                          .getadaptiveTextSize(context, 14),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                        )),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: size.height * 0.02)),
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
                              fontSize:  18,
                              fontWeight: FontWeight.w400),
                        )
                      ]),
                    ),
                    VerticalDivider(
                      color: Colors.white38,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Column(children: [
                        Text(
                          '$followers', //'${model.userData["seguidores"]}',
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
                      onPressed: () {},
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
                        if(postSnapshot.docs[index]['uidUser'] == widget.uidUsuario){
                          return PostTile(
                            imageURL: postSnapshot.docs[index]['imageURL'],
                            postID: postSnapshot.docs[index].id,
                            user: postSnapshot.docs[index]['user'],
                            descricaoDaReceita: postSnapshot.docs[index]['descricaoDaReceita'],
                            username: postSnapshot.docs[index]['username'],
                            useruid: user.uid,
                            userPhotoURL: postSnapshot.docs[index]['userImage'],
                            currentPage: "homePage",
                            porcoes: postSnapshot.docs[index]['porcoes'],
                            modoDePreparo: postSnapshot.docs[index]['preparo'],
                            tempoDePreparo: postSnapshot.docs[index]['tempoDePreparo'],
                            ingredientes: postSnapshot.docs[index]['ingredientes'],
                            curtidas: postSnapshot.docs[index]['likes'].length,
                            isLiked: postSnapshot.docs[index]['likes'].containsKey(user.uid)?false:true,
                            isSaved:  postSnapshot.docs[index]['saves'].containsKey(user.uid)?true:false,
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
            height: size.height,
            width: size.width,
            user: user,
            selectedImage: selectedImage,
            onGoBack: onGoBack,
          ),
        ],
      ),

      // Barra Inferior:
    );
  }
}
