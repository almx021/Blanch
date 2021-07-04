import 'dart:async';
import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/core/App_Builders.dart';
import 'package:appteste/core/App_Variables.dart';
import 'package:appteste/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'App_Account_Page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user = FirebaseAuth.instance.currentUser;

  FirePost firePost = FirePost();
  QuerySnapshot postSnapshot;

  Future<Null> _onRefresh () async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => super.widget));
    });
    return null;
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  Widget PostList() {
    return Container(
      child: Column(
        children: [
          postSnapshot != null
              ? ListView.builder(
                  reverse: true,
                  itemCount: postSnapshot.docs.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {

                    void deletar() async {
                      if (postSnapshot.docs[index]['uidUser'].contains(user.uid)){
                        await FirebaseFirestore.instance.collection('posts').doc(postSnapshot.docs[index].id).delete();
                      } else {
                        return null;
                      }
                    }

                    return PostTile(
                        imageURL: postSnapshot.docs[index]['imageURL'],
                        postID: postSnapshot.docs[index].id,
                        user: postSnapshot.docs[index]['user'],
                        descricaoDaReceita: postSnapshot.docs[index]['descricaoDaReceita'],
                        username: postSnapshot.docs[index]['username'],
                        useruid: user.uid,
                        userPhotoURL: postSnapshot.docs[index]['userImage'],
                        currentPage: "homePage",
                      );
                    }


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
          RefreshIndicator(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 100),
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
              onRefresh: _onRefresh),
          Builders.buildBottomNavBar(
            context: context,
            type: "home",
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

class Constants{
  static const String DeletarPost = "Deletar post";

  static const List<String> choices = <String>[
    DeletarPost,
  ];
}

class PostTile extends StatelessWidget {
  String descricaoDaReceita;
  String user;
  String imageURL;
  String postID;
  String useruid;
  String username;
  String userPhotoURL;
  String currentPage;
  User currentUser = FirebaseAuth.instance.currentUser;

  PostTile({@required this.imageURL, this.descricaoDaReceita, this.user, this.postID, this.useruid, this.username,
    this.userPhotoURL, this. currentPage});

  int curtidas = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Map<String, dynamic> postData = {
      "imageURL": imageURL,
      "userUid" : useruid,
      "postId" : postID,
    };

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
                      child: CircleAvatar(
                        radius:20,
                        backgroundImage: NetworkImage(
                          userPhotoURL,
                        ),
                      ),
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
                                    fontWeight: FontWeight.w500,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 14.5)),
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.010),
                                  child: Text(
                                    'tem nova receita!',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AdaptiveTextSize()
                                            .getadaptiveTextSize(context, 14.5)),
                                  )),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GradientText(
                              '@$username',
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
                      child: currentPage == "perfilPage"?PopupMenuButton<String>(
                        icon: Icon(Icons.more_vert,color: Colors.white),
                        onSelected: choiceAction,
                        itemBuilder: (BuildContext context){
                          return Constants.choices.map((String choice){
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ):PopupMenuButton<String>(
                        icon: Icon(Icons.more_vert,color: Colors.white),
                        onSelected: choiceAction,
                        itemBuilder: (BuildContext context){
                          return Constants.choices.map((String choice){

                          }).toList();
                        },
                      )
                    )),
              ],
            ),
          ),
          GestureDetector(
          child: Container(
            height: size.height * .25,
            width: size.width,
            child: Image.network(
              imageURL,
              fit: BoxFit.cover,
            ),
          ),
            onTap: (){
              Navigator.pushNamed(context, '/DetalhesPost');
            },
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
                              .getadaptiveTextSize(context, 14))),
                ),
                GradientText(
                  '  #Salgado #Tag1 #Tag2',
                  gradient: AppGradients.linear,
                  style: TextStyle(
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 14.5)),
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
                              fontWeight: FontWeight.w500,
                              fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 14.5)),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: size.width * 0.015)),
                        Flexible(
                          child: Text(
                            '${descricaoDaReceita}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AdaptiveTextSize()
                                    .getadaptiveTextSize(context, 14.5)),
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
                        color: Colors.white,),
                      onTap: () {
                        FirebaseFirestore.instance.collection("PostsSalvos").
                        doc("$useruid-$postID").set(postData);
                      }),
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
                      fontWeight: FontWeight.w500,
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 14)),
                ),
                Padding(padding: EdgeInsets.only(left: size.width * 0.015)),
                Text(
                  'Muito bom!',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 14)),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/DetalhesPost');
                },
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
                        AdaptiveTextSize().getadaptiveTextSize(context, 11)),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void choiceAction(String choice)async{
    QuerySnapshot _myDoc = await FirebaseFirestore.instance.collection('PostsSalvos').get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    if(choice == Constants.DeletarPost){
      if(useruid == currentUser.uid){
        await FirebaseFirestore.instance.collection('posts').doc(postID).delete();
        for(int i = 0; i < _myDocCount.length; i++){
          if(_myDocCount[i]['postId'].contains(postID)){
            //Excluir item salvo do firebase
          }
    }
      }
    }
  }
}
