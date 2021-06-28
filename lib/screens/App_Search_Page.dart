import 'dart:async';

import 'package:appteste/core/App_Builders.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:gradient_text/gradient_text.dart';

import 'App_Account_Page.dart';
import 'App_Perfil_Page.dart';
import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/core/App_Variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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

  _onSearchChanged(){

    print(_searchUserController.text);
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  Future<QuerySnapshot> searchResultsFuture;

  searchUser(){
    Future<QuerySnapshot> users = usersCollectionFirebase
        .get();
    setState(() {
      searchResultsFuture = users;
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    buildSearchResults(){
      return FutureBuilder(
          future: searchResultsFuture,
          builder: (context,snapshot) {
            if(!snapshot.hasData){
              return Container(
                color: AppColors.backGroundApp,
                width: size.width,
                height: size.height,
              );
            }
            List<Row> searchResults = [];

            if(_searchUserController.text != ''){
              for(int i = 0; i < (snapshot.data.docs.length); i++) {
                if(snapshot.data.docs[i]['name'].toLowerCase().contains(_searchUserController.text.toLowerCase()))
                  searchResults.add(Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(0.0),
                          minimumSize: Size(25.0, 25.0),
                        ),
                        onPressed: () {},
                        child: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: AssetImage(
                              AppImages.perfilImage,
                            )),
                      ),
                      Container(
                          width: size.width - 70,
                          padding: EdgeInsets.only(left: 0),
                          child: TextButton(
                            style: TextButton.styleFrom(),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/PerfilOutroUsuario');
                            },
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    GradientText(snapshot.data.docs[i]['name'],
                                        gradient: AppGradients.orangelinear,
                                        style: TextStyle(
                                            fontSize: AdaptiveTextSize()
                                                .getadaptiveTextSize(
                                                context, 12),
                                            fontWeight: FontWeight.w500)),
                                    Padding(
                                        padding: EdgeInsets.only(top: 3.0)),
                                    Text('@${snapshot.data.docs[i]['username']}',
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
                  ),);
              }
            }
            return ListView(
              children: searchResults,
            );
          });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundApp,
        automaticallyImplyLeading: false,
        title: TextField(
          style: TextStyle(color: Colors.white),
          controller: _searchUserController,
          onSubmitted: searchUser(),
          decoration: InputDecoration(
            icon: IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: (){
              },
            ),
            hintText: "Pesquisar",
            hintStyle: TextStyle(color: Colors.white),
            ),
          onChanged: (text){
            setState(() {
              searchUser();
            });
          },

          ),
        ),


      body: Stack(
        children: [
          searchResultsFuture == null ? SingleChildScrollView(
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
                    ],
                  ),
                ),
              ],
            ),
          ):
          Container(
            child: buildSearchResults(),
            color: AppColors.backGroundApp,
            width: size.width,
            height: size.height,
            // child: Image.asset(AppImages.novoPost),
          ),
          Builders.buildBottomNavBar(
            context: context,
            type: "search",
            height: size.height,
            width: size.width,
            user: currentUser,
            selectedImage: selectedImage,
            onGoBack: onGoBack,
          ),
        ],
      ),
    );
  }
  }
