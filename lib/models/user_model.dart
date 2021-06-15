import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class UserModel extends Model {


  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  GoogleSignInAccount _user;
  GoogleSignInAccount get user => _user;
  User firebaseUser;
  User currentUser;
  Map<String, dynamic> userData = Map(); //Dados do usuário

  bool isLoading = false;

  void signUP({@required Map<String, dynamic> userData,@required String pass,
    @required VoidCallback onSuccess,@required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();
    _auth.createUserWithEmailAndPassword(
        email: userData["email"],
        password: pass
    ).then((authResult) async {
      firebaseUser = authResult.user;
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
            (authResult) {
          firebaseUser = authResult.user;
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

  void signInWithGoogle({@required VoidCallback onSuccess, @required VoidCallback onFail})async{
    try{
      final User user = await getUserGoogle();
      onSuccess();
    }
    catch(error){
      onFail();
    }
  }


  Future<User> getUserGoogle()async{
    if(currentUser != null) return currentUser;

    try{
      final GoogleSignInAccount googleSignInAccount =
      await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      final User user = userCredential.user;

      return user;
    } catch(error){
      return null;
    }
  }

  void recoverPassword(String email){
    _auth.sendPasswordResetEmail(email: email);

  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await firestore.collection("users").doc(firebaseUser.uid).set(userData);
  }

}

