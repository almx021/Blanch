import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class UserModel extends Model {

  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map(); //Dados do usuário

  bool isLoading = false;

  void signUP({@required Map<String, dynamic> userData,@required String pass,
    @required VoidCallback onSuccess,@required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();
    _auth.createUserWithEmailAndPassword(
        email: userData["email"],
        password: pass
    ).then((user) async {
      firebaseUser = user;
      await _saveUserData(userData);
      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e){
      if(e.toString() == "PlatformException(Error performing setData, PERMISSION_DENIED: Missing or insufficient permissions., null, null)") 
        onSuccess();
        else{
      onFail();
      isLoading = false;
      notifyListeners();
        }
    });
  }
  void signIn({@required String email, @required String pass,
    @required VoidCallback onSuccess, @required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();

    _auth.signInWithEmailAndPassword(email: email, password: pass).then(
            (user) {
          firebaseUser = user;

          onSuccess();
          isLoading = false;
          notifyListeners();
        }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void signOut(){

  }

  void recoverPassword(){

  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userData);
  }

}

