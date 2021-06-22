import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditarPerfilPage extends StatefulWidget {
  @override
  _EditarPerfilPageState createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
          'Editar Perfil',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.backGroundApp),
          ),
          Column(
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
                      Container(
                        child: CircleAvatar(
                          radius: 41.0,
                          backgroundImage: user.photoURL == null
                              ? NetworkImage(AppImages.perfilImage)
                              : NetworkImage(
                                  user.photoURL,
                                ),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.only(left: 28, top: 28),
                        onPressed: () {},
                        icon: Image.asset(
                          AppImages.iconeCamera,
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
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome de usuário",
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Introdução",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                ),
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Website",
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        ],
      ),
    );
  }
}
