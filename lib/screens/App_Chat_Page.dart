
import 'dart:async';
import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

import 'App_Mensagens_Page.dart';

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}
class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  QuerySnapshot userSnapshot;
  User currentUser = FirebaseAuth.instance.currentUser;
  final TextEditingController _searchUserController = TextEditingController();
  var usersCollectionFirebase = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    _searchUserController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchUserController.removeListener(_onSearchChanged);
    _searchUserController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    print(_searchUserController.text);
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  Future<QuerySnapshot> searchResultsFuture;

  searchUser() {
    Future<QuerySnapshot> users = usersCollectionFirebase.get();
    setState(() {
      searchResultsFuture = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    buildSearchResults() {
      return FutureBuilder(
          future: searchResultsFuture,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                color: AppColors.backGroundApp,
                width: size.width,
                height: size.height,
              );
            }
            List<GestureDetector> searchResults = [];

            if (_searchUserController.text != '') {
              for (int i = 0; i < (snapshot.data.docs.length); i++) {
                if (( snapshot.data.docs[i]['name']
                    .toLowerCase()
                    .contains(_searchUserController.text.toLowerCase()) || snapshot.data.docs[i]['username']
                    .toLowerCase()
                    .contains(_searchUserController.text.toLowerCase()) )  )
                  searchResults.add(
                    GestureDetector(child: Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0.0),
                            minimumSize: Size(25.0, 25.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    currentUser.uid == snapshot.data.docs[i].id ? ChatPage() : MensagemPage(
                                      fotoDoOutroUsuario: snapshot.data.docs[i]['photoURL'],
                                      nomeDaPessoa: snapshot.data.docs[i]['name'],
                                      caraQueTaRecebendoMensagem: snapshot.data.docs[i].id,
                                      caraQueTaMandandoMensagem: currentUser.uid,
                                    )));
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                            NetworkImage(snapshot.data.docs[i]['photoURL']),
                          ),
                        ),
                        Container(
                            width: size.width - 70,
                            padding: EdgeInsets.only(left: 0),
                            child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        currentUser.uid == snapshot.data.docs[i].id ? ChatPage() : MensagemPage(
                                          fotoDoOutroUsuario: snapshot.data.docs[i]['photoURL'],
                                          nomeDaPessoa: snapshot.data.docs[i]['name'],
                                          caraQueTaRecebendoMensagem: snapshot.data.docs[i].id,
                                          caraQueTaMandandoMensagem: currentUser.uid,
                                        )));
                              },
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      GradientText(
                                          snapshot.data.docs[i]['name'],
                                          gradient: AppGradients.orangelinear,
                                          style: TextStyle(
                                              fontSize: AdaptiveTextSize()
                                                  .getadaptiveTextSize(
                                                  context, 12),
                                              fontWeight: FontWeight.w500)),
                                      Padding(
                                          padding: EdgeInsets.only(top: 3.0)),
                                      Text(
                                          '@${snapshot.data
                                              .docs[i]['username']}',
                                          style: TextStyle(
                                              fontSize: AdaptiveTextSize()
                                                  .getadaptiveTextSize(
                                                  context, 14),
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  )),
                            )),
                      ],
                    ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                currentUser.uid == snapshot.data.docs[i].id ? ChatPage() : MensagemPage(
                                  fotoDoOutroUsuario: snapshot.data.docs[i]['photoURL'],
                                  nomeDaPessoa: snapshot.data.docs[i]['name'],
                                  caraQueTaRecebendoMensagem: snapshot.data.docs[i].id,
                                  caraQueTaMandandoMensagem: currentUser.uid,
                                )));
                      },
                    ),
                  );
              }
            }
            return ListView(
              children: searchResults,
            );
          });
    }

    conversas(){
      return searchResultsFuture == null
          ? SingleChildScrollView(
        child:
      Stack(
        children: [
          SingleChildScrollView(
            child:
          Container(
            color: AppColors.backGroundApp,
            width: size.width,
            height: size.height*0.777,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('chatRoom')
                    .doc(currentUser.uid)
                    .collection('conversas')
                    .orderBy('time', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  List<DocumentSnapshot> chatRooms =
                  snapshot.data.docs.reversed.toList();
                  return ListView.builder(
                    reverse: false,
                      itemCount: chatRooms.length,
                      itemBuilder: (context, index) {
                        return
                          TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.backGroundApp,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28.0,
                                    backgroundImage: NetworkImage(
                                        snapshot.data.docs[index]['imageURL']),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: size.width * 0.03),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(snapshot.data.docs[index]['name'],
                                              style: TextStyle(
                                                  fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500)),
                                          Padding(padding: EdgeInsets.only(top: size.height * 0.001)),
                                          RichText(
                                              text: TextSpan(
                                              style: TextStyle(
                                                  fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500),
                                                  children: [
                                                    TextSpan(text:snapshot.data.docs[index]['ultimaMensagem']),
                                                    WidgetSpan(
                                                      child: Padding(
                                                        padding:  EdgeInsets.only(left:5, top:15),
                                                      ),
                                                    ),
                                                    snapshot.data.docs[index]['ultimaMensagem'] == 'imagem' ? WidgetSpan(
                                                      child:  Icon(Icons.camera_alt_outlined, color: Colors.grey,),
                                                    ):WidgetSpan(
                                                      child: Text('')
                                                    )
                                                  ]
                                              ),
                                         )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MensagemPage(
                                              fotoDoOutroUsuario: snapshot.data.docs[index]['imageURL'],
                                              nomeDaPessoa: snapshot.data.docs[index]['name'],
                                              caraQueTaRecebendoMensagem: snapshot.data.docs[index]['userID'],
                                              caraQueTaMandandoMensagem: currentUser.uid,
                                            )));
                              }
                          );
                      }
                  );
                }
            ),

            // child: Image.asset(AppImages.novoPost),
      ) ),
        ],
      )
      )
          : Container(
        child: buildSearchResults(),
        color: AppColors.backGroundApp,
        width: size.width,
        height: size.height,
      );
    }
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.backGroundApp,
          centerTitle: true,
          leading: IconButton(
              icon: Image.asset(AppImages.leftArrow, width: 25),
              onPressed: () {
               Navigator.pop(context);
              }),
          title: Text(
            'Mensagens',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: AppColors.backGroundApp),
            ),
            SingleChildScrollView(
            child:
            Column(
                children: [

                  Padding(padding: EdgeInsets.only(top: size.height * 0.03)),
                  Container(
                    width: size.width * 0.9,
                    child: TextField(
                      onChanged: (text) {
                        setState(() {
                          searchUser();
                        });
                      },
                      controller: _searchUserController,
                      style: TextStyle(
                          fontSize: AdaptiveTextSize().getadaptiveTextSize(
                              context, 14),
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 9.0, right: 9.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                              )),
                          prefixIconConstraints: BoxConstraints(
                            minHeight: 16,
                            minWidth: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          isCollapsed: true,
                          contentPadding: EdgeInsets.all(12),
                          fillColor: Color(0xff282828),
                          filled: true,
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                          hintText: 'Pesquisar')
                      ,
                    ),
                  ),
                        Padding(padding: EdgeInsets.only(top: size.height * 0.03)),
                  conversas()

                ],
              ),
            )
          ],

        ),
      );
    }
  }
