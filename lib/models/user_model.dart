import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuth {

  static bool isSignedInWithGoogle = false;

  static Future<User> registerUsingEmailPassword({
    String name,
    String email,
    String password,
    String photoURL,
    String username,
    bool isNewUser,

  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
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
      await _saveUserData(name, email, photoURL, isNewUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    await user.sendEmailVerification();
    print("User is New user? ${isNewUser}");
    return user;
  }

  static Future<User> signInWithGoogle(
      {@required VoidCallback onSuccess, @required VoidCallback onFail}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    bool isNewUser;

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


        await _saveUserData(user.displayName, user.email, user.photoURL, isNewUser);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          print('Conta existe com diferentes credenciais');
        } else if (e.code == 'invalid-credential') {
          print("credencial invalida");
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        onFail();
      }
    }
    print("User Name: ${user.displayName}");
    print("User Email ${user.email}");
    print("User Photo: ${user.photoURL}");
    print("User is New user? ${isNewUser}");

    return user;
  }

  static Future<User> signInUsingEmailPassword({
    String email,
    String password,
    BuildContext context,
  }) async {
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
      await _saveUserData(user.displayName, user.email, user.photoURL, isNewUser);
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

  static Future<User> passwordRecover(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
  }

  static Future<Null> _saveUserData(
      String name, String email, String photoURL, bool newUser) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    Map<String, dynamic> userData = {
      "name": name,
      "email": email,
      "photoURL": photoURL,
      "newUser": newUser,
    };
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection("users").doc(user.uid).set(userData);
  }

  static Future<void> signUserOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();

    await FirebaseAuth.instance.signOut();
  }

  static Future<void> deleteAccount() async {
    //testando ainda, nao ta pronto
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    try {
      await user.delete();
    } catch (e) {
      print("x");
    }
  }
}
