import 'dart:io';
import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appteste/core/App_Variables.dart';

import 'App_Account_Page.dart';

class EditarPerfilPage extends StatefulWidget {
  @override
  _EditarPerfilPageState createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _introController = TextEditingController();
  final _siteController = TextEditingController();
  final _focusName = FocusNode();
  final _focusUsername = FocusNode();
  final _focusIntro = FocusNode();
  final _focusSite = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final _picker = ImagePicker();

  User user = FirebaseAuth.instance.currentUser;

  Future<void> getImage() async {
    final PickedFile image =
        await _picker.getImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() {
      selectedImage = File(image.path);
      FireAuth.updateProfilePic(selectedImage);
    });
  }
  QuerySnapshot postSnapshot;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        _focusUsername.unfocus();
      },
      child: ScaffoldMessenger(
          key: _scaffoldMessengerKey,
          child:Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backGroundApp,
        centerTitle: true,
        leading: IconButton(
            icon: Image.asset(AppImages.leftArrow, width: 25),
            onPressed: () {
              Navigator.pop(
                context,
                /*      MaterialPageRoute(
                      builder: (context) => (Image.asset(selectedImage.path)))*/
              );
            }),
        title: Text(
          'Editar Perfil',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.backGroundApp),
          ),
    SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: width * 0.5 - 50, top: height * 0.05),
                  ),
                  Stack(
                    children: [
                      InkWell(
                          child: Container(
                            child: CircleAvatar(
                              radius: 41.0,
                              backgroundImage: selectedImage == null
                                  ? user.photoURL == null
                                      ? AssetImage(AppImages.perfilImage)
                                      : NetworkImage(
                                          user.photoURL,
                                        )
                                  : FileImage(selectedImage),
                            ),
                          ),
                          onTap: () {
                            getImage();
                          }),
                      IconButton(
                        padding: EdgeInsets.only(left: 28, top: 28),
                        onPressed: () {},
                        icon: Image.asset(
                          AppImages.cameraicon,
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.05),
              ),
              TextFormField(
                controller: _nameController,
                focusNode: _focusName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              TextFormField(
                controller: _usernameController,
                focusNode: _focusUsername,
                validator: _validator,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome de usuário",
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              TextFormField(
                controller: _introController,
                focusNode: _focusIntro,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Introdução",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                ),
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                controller: _siteController,
                focusNode: _focusSite,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Website",
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: size.width * 0.4,
                  height: size.height * 0.06,
                  child: TextButton(
                  onPressed: () async {
                    await FireAuth.editInfos(
                      name: _nameController.text,
                      intro: _introController.text,
                      site: _siteController.text,
                        getInfos: FireAuth.getInfos);
                    if(_nameController.text.trim() != '' || _introController.text.trim() != '' || _siteController.text.trim() != ''){
                      _nameController.clear();
                      _introController.clear();
                      _siteController.clear();
                      _onSucess();
                    }
                    if(_usernameController.text.trim() != ''){
                    bool usernameValidated = await userValidate(
                        _usernameController.text);
                    if (_formKey.currentState.validate() &&
                        usernameValidated == true) {
                      await FireAuth.updateUsername(
                          username: _usernameController.text,
                          getInfos: FireAuth.getInfos);
                      _usernameController.clear();
                      _onSucess();
                    }
                    setState(() {
                      usernameValidated = true;
                    });
                    };
                  },
                  child: Text("Alterar",
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 14),
                          color: Colors.white,
                          )),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.white10)),
                  ),
                ),
    ),
              ),
    ),
            ],
          ),
    ),
        ],
      ),),
    )));
  }


  Future<bool> userValidate(String username) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var collection = firestore.collection("users");
    final docSnapshot =
    await collection.where("username", isEqualTo: username).get();
    print(docSnapshot);
    print(docSnapshot.docs.length);

    if (docSnapshot.docs.length > 0) {
      _onFail();
      return false;
    }

    return true;
  }

  void _onFail() {
    _scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário já existe"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
  void _onSucess(){
    _scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
      content: Text("Alterações realizadas com sucesso!"),
      backgroundColor: Colors.lightGreen,
      duration: Duration(seconds: 2),
    ));
  }

  String _validator(String value) {
    if (value.length < 5 || value.isEmpty) {
      return "Username is too short";
    }
  }
}
