import 'dart:async';

import 'package:appteste/core/App_Builders.dart';
import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/core/App_Variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

import 'App_Home_Page.dart';

class EmAltaPage extends StatefulWidget {
  @override
  _EmAltaPageState createState() => _EmAltaPageState();
}

class _EmAltaPageState extends State<EmAltaPage> {
  User user = FirebaseAuth.instance.currentUser;

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backGroundApp,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(AppImages.leftArrow, width: 25),
        ),
        title: GradientText(
          'BLANCH',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          gradient: AppGradients.linearinverso,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.backGroundApp),
          ),
          SingleChildScrollView(
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
          ),
          Builders.buildBottomNavBar(
            context: context,
            type: "emAlta",
            height: size.height,
            width: size.width,
            user: user,
            selectedImage: selectedImage,
            onGoBack: onGoBack,
          )
        ],
      ), // Barra Inferior:
    );
  }
}
