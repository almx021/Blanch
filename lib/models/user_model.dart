import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FireAuth {
  static SharedPreferences _preferences;
  static Map<String, dynamic> userData;

  static bool isSignedInWithGoogle = false;

  static Future<User> registerUsingEmailPassword({
    String name,
    String email,
    String password,
    bool isNewUser,
    VoidCallback onSuccess,
    VoidCallback onFail,
  }) async {
    Map<String, dynamic> userData = {
      "name": name,
      "email": email,
      "newUser": isNewUser,
      "photoURL":
          'https://firebasestorage.googleapis.com/v0/b/blanch-d9db7.appspot.com/o/UsersProfilePictures%2Fdlyd8oBRuEbhtHWMXeE9xL5XxrN2%2F1625331729814531?alt=media&token=678b005a-56a7-4fdc-936f-2409b01beaa3'
    };

    FirebaseAuth auth = FirebaseAuth.instance;
    User user;

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
      isNewUser = userCredential.additionalUserInfo.isNewUser;
      await firestore.collection("users").doc(user.uid).set(userData);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        onFail();
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        onFail();
      }
    } catch (e) {
      print(e);
    }
    await user.sendEmailVerification();
    print("User is New user? $isNewUser");
    return user;
  }

  static Future<User> signInWithGoogle(
      {@required VoidCallback onSuccess,
      @required VoidCallback onFail,
      @required VoidCallback getInfos}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    bool isNewUser;

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
        isNewUser = userCredential.additionalUserInfo.isNewUser;

        Map<String, dynamic> userData = {
          "name": user.displayName,
          "email": user.email,
          "photoURL": user.photoURL,
          "newUser": isNewUser,
        };

        print("user is new user 1$isNewUser");
        if (isNewUser) {
          await firestore.collection("users").doc(user.uid).set(userData);
        } else {
          await firestore
              .collection("users")
              .doc(user.uid)
              .update({"newUser": isNewUser});
        }

        getInfos();
        onSuccess();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          print('Conta existe com diferentes credenciais');
          onFail();
        } else if (e.code == 'invalid-credential') {
          print("credencial invalida");
          onFail();
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          onFail();
        }
      } catch (e) {
        onFail();
      }
    }
    print("User Name: ${user.displayName}");
    print("User Email ${user.email}");
    print("User Photo: ${user.photoURL}");
    print("User is New user? $isNewUser");

    return user;
  }

  static Future<User> signInUsingEmailPassword(
      {String email,
      String password,
      BuildContext context,
      VoidCallback onSuccess,
      VoidCallback onFail,
      VoidCallback getInfos,
      String username}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    bool isNewUser;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      isNewUser = userCredential.additionalUserInfo.isNewUser;

      getInfos();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }

  static Future<User> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  static Future<String> passwordRecover(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.sendPasswordResetEmail(email: email);
      return 'ok';
    } catch (e) {
      return e.toString();
    }
  }

  /*static Future<Null> _saveUserData(
      String name, String email, String photoURL, bool newUser, String username) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    Map<String, dynamic> userData = {
      "name": name,
      "email": email,
      "photoURL": photoURL,
      "newUser": newUser,
      "username": "",
    };
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection("users").doc(user.uid).set(userData);

  }*/

  static Future<Null> updateUsername(
      {@required String username, @required VoidCallback getInfos}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    Map<String, dynamic> userData = {
      "username": username,
    };
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot result = await Future.value(FirebaseFirestore.instance
        .collection('posts')
        .where('uidUser', isEqualTo: user.uid)
        .get());
    final List<DocumentSnapshot> documents = result.docs;
    for (int i = 0; i < (documents.length); i++) {
      if (documents[i]['uidUser'].contains(user.uid)) {
        await FirebaseFirestore.instance
            .collection("posts")
            .doc(documents[i].id)
            .update(userData);
      }
    }
    await firestore.collection("users").doc(user.uid).update(userData);
    getInfos();
  }

  static Future<Null> editInfos(
      {String name,
      String site,
      String intro,
      @required VoidCallback getInfos}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Map<String, dynamic> nameData = {
      "name": name,
    };
    Map<String, dynamic> postName = {
      "user": name,
    };
    if (name.trim() != '') {
      final QuerySnapshot result = await Future.value(FirebaseFirestore.instance
          .collection('posts')
          .where('uidUser', isEqualTo: user.uid)
          .get());
      final List<DocumentSnapshot> documents = result.docs;
      for (int i = 0; i < (documents.length); i++) {
        if (documents[i]['uidUser'].contains(user.uid)) {
          await FirebaseFirestore.instance
              .collection("posts")
              .doc(documents[i].id)
              .update(postName);
        }
      }
      await firestore.collection("users").doc(user.uid).update(nameData);
    }
    Map<String, dynamic> siteData = {
      "site": site,
    };
    if (site.trim() != '') {
      await firestore.collection("users").doc(user.uid).update(siteData);
    }
    Map<String, dynamic> introData = {
      "intro": intro,
    };
    if (intro.trim() != '') {
      await firestore.collection("users").doc(user.uid).update(introData);
    }
    getInfos();
  }

  static Future updateProfilePic(File image) async {
    User user = FirebaseAuth.instance.currentUser;

    if (image != null) {
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child("UsersProfilePictures/${user.uid}/" +
              DateTime.now().microsecondsSinceEpoch.toString())
          .putFile(image);

      TaskSnapshot taskSnapshot = await task;
      var url = await taskSnapshot.ref.getDownloadURL();
      Map<String, dynamic> userData = {"photoURL": url};
      Map<String, dynamic> postData = {"userImage": url};
      final QuerySnapshot result = await Future.value(FirebaseFirestore.instance
          .collection('posts')
          .where('uidUser', isEqualTo: user.uid)
          .get());
      final List<DocumentSnapshot> documents = result.docs;
      for (int i = 0; i < (documents.length); i++) {
        if (documents[i]['uidUser'].contains(user.uid)) {
          await FirebaseFirestore.instance
              .collection("posts")
              .doc(documents[i].id)
              .update(postData);
        }
      }

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection("users").doc(user.uid).update(userData);

      await user.updatePhotoURL(url);
      getInfos();
    }
  }

  static Future<Null> updateIsNewUser({String isNewUser}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    Map<String, dynamic> userData = {
      "newUser": isNewUser,
    };
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection("users").doc(user.uid).update(userData);
  }

  static Future<void> signUserOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();

    await FirebaseAuth.instance.signOut();
  }

  static Future reauthenticateWithCredential(String password) async {
    try {
      User user = FirebaseAuth.instance.currentUser;
      AuthCredential credentials =
          EmailAuthProvider.credential(email: user.email, password: password);
      try {
        await user.reauthenticateWithCredential(credentials);
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case 'too-many-requests':
            return 'Erro Interno!\nTente Novamente Mais Tarde!';
          case 'wrong-password':
            return 'Senha Incorreta!';
          default:
            return null;
        }
      }
    } catch (e) {
      print('ERRO: ${e.toString()}');
    }
  }

  static Future deleteAccount(password) async {
    User user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseStorage storage = FirebaseStorage.instance;

    try {
      await storage
          .ref()
          .child("UsersProfilePictures/${user.uid}/")
          .list()
          .then(
              (element) => element.items.forEach((item) {
                    item.delete();
                  }), onError: (e) {
        print('ERRO onError: $e');
      });
    } catch (e) {
      print("ERRO $e");
      if (e.toString() == "No object exists at the desired reference.")
        print('OBJETO INEXISTENTE');
    } finally {
      await firestore.collection('users').doc(user.uid).delete();
      await user.delete();
    }
  }

  static Future<void> getInfos() async {
    User user = FirebaseAuth.instance.currentUser;
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(user.uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data();
      print("dados tela home${data['newUser']}");
      print(data);
      print(data['username']);
      userData = data;
    }
  }

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

/*Future<void> getUsername() async {
    Map<String, dynamic> data = await   getInfos();
    print("dadosss $data");
    final String username = await data['username'];
    setState(() => _username = username);
    print(_username);
  }*/

}
