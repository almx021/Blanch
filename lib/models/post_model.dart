import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FirePost {
  static getData() async {
    return await FirebaseFirestore.instance.collection("posts").get();
  }

  static Future<User> registerPostData({
    String descricaoDaReceita,
    String tempoDePreparo,
    String porcoes,
    String ingredientes,
    String preparo,
    String uidUser,
    String user,
    String url,
    File image,
    @required VoidCallback onSuccess,
  }) async {
    onSuccess();

    if (image != null) {
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child(DateTime.now().microsecondsSinceEpoch.toString())
          .putFile(image);

      TaskSnapshot taskSnapshot = await task;
      url = await taskSnapshot.ref.getDownloadURL();
    }

    Map<String, dynamic> postData = {
      "descricaoDaReceita": descricaoDaReceita,
      "tempoDePreparo": tempoDePreparo,
      "porcoes": porcoes,
      "ingredientes": ingredientes,
      "preparo": preparo,
      "uidUser": uidUser,
      "user": user,
      "imageURL": url,
    };

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection("posts").doc().set(postData);
  }
}
