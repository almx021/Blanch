import 'dart:io';

import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appteste/models/chatMessage_model.dart';

import 'App_Username_Page.dart';

class MensagemPage extends StatefulWidget {
  @override
  _MensagemPageState createState() => _MensagemPageState();
}

class _MensagemPageState extends State<MensagemPage> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      currentUser = user;
    });
  }

  String url;
  User currentUser = FirebaseAuth.instance.currentUser;


  void _sendMessage({String text, File imgFile}) async {
    Map<String, dynamic> data = {
      'uid': user.uid,
      'senderName': user.displayName,
      'senderPhotoUrl': user.photoURL,
      'time': Timestamp.now()
    };

    if (imgFile != null) {
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child(DateTime.now().microsecondsSinceEpoch.toString())
          .putFile(imgFile);

      TaskSnapshot taskSnapshot = await task;
      url = await taskSnapshot.ref.getDownloadURL();
      data['imgUrl'] = url;
    }
    if (text != null) data['text'] = text;
    FirebaseFirestore.instance.collection('mensagens').add(data);
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
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
          'Sample',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        actions: [
          Container(
            width: w * 0.15,
            child: IconButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/men/5.jpg"),
                maxRadius: 20,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: AppColors.backGroundApp),
        child: Column(

          children: <Widget>[

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('mensagens')
                      .orderBy('time')
                      .snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        List<DocumentSnapshot> menssage =
                        snapshot.data.docs.reversed.toList();

                        return ListView.builder(
                            itemCount: menssage.length,
                            reverse: true,
                            itemBuilder: (context, index) {
                              return MenssageTile(
                                 data:menssage[index].data());
                            });
                    }
                  }),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backGroundApp,
                ),
                child: Container(
                  margin: EdgeInsets.all(w * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color.fromRGBO(29, 29, 29, 1),
                  ),
                  padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 60,
                  width: double.infinity,
                  child: TextComposer(_sendMessage),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

class MenssageTile extends StatelessWidget {

  User currentUser = FirebaseAuth.instance.currentUser;

  MenssageTile({ this.data});

  final Map<String,dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: SingleChildScrollView(
        child: data['uid'] != user.uid
            ? Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: (AppGradients.orangelinear),
                  ),
                  padding: EdgeInsets.all(16),
                  child:
                  data['imgUrl'] != null ?
                      Image.network(data['imgUrl'])
                  :Text(
                    data['text'],
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              )
            : Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: (AppGradients.grey),
                  ),
                  padding: EdgeInsets.all(16),
                  child:
                  data['imgUrl'] != null ?
                  Image.network(data['imgUrl'])
                  :Text(
                    data['text'],
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
      ),
    );
  }
}
