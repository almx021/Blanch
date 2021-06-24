import 'dart:io';

import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appteste/models/chatMessage_model.dart';

class MensagemPage extends StatefulWidget {
  @override
  _MensagemPageState createState() => _MensagemPageState();
}

class _MensagemPageState extends State<MensagemPage> {
  String url;

  void _sendMessage({String text, File imgFile}) async {
    Map<String, dynamic> data = {};

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
    // List<ChatMessage> messages = [
    //   ChatMessage(
    //       messageContent: "Bom dia Marcelo, como vai?", messageType: "sender"),
    //   ChatMessage(
    //       messageContent: "Tenho novidades para te falar",
    //       messageType: "sender"),
    //   ChatMessage(messageContent: "Eu to bem Ana!", messageType: "receiver"),
    //   ChatMessage(
    //       messageContent: "Conta aí as novidades!", messageType: "receiver"),
    //   ChatMessage(
    //       messageContent: "Bom dia Marcelo, como vai?", messageType: "sender"),
    //   ChatMessage(
    //       messageContent: "Tenho novidades para te falar",
    //       messageType: "sender"),
    //   ChatMessage(messageContent: "Eu to bem Ana!", messageType: "receiver"),
    //   ChatMessage(
    //       messageContent: "Conta aí as novidades!", messageType: "receiver"),
    //   ChatMessage(messageContent: "Eu to bem Ana!", messageType: "receiver"),
    //   ChatMessage(
    //       messageContent: "Conta aí as novidades!", messageType: "receiver"),
    //   ChatMessage(
    //       messageContent: "Bom dia Marcelo, como vai?", messageType: "sender"),
    //   ChatMessage(
    //       messageContent: "Tenho novidades para te falar",
    //       messageType: "sender"),
    //   ChatMessage(messageContent: "Eu to bem Ana!", messageType: "receiver"),
    //   ChatMessage(
    //       messageContent: "Conta aí as novidades!", messageType: "receiver"),
    // ];
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
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: AppColors.backGroundApp),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('mensagens')
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
                              mensagens: menssage[index]['text'],
                            );
                          });
                  }
                  ;
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
    );
  }
}

class MenssageTile extends StatelessWidget {
  String mensagens;

  MenssageTile({@required this.mensagens});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: (AppGradients.orangelinear),
          ),
          padding: EdgeInsets.all(16),
          child: Text(
            mensagens,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
