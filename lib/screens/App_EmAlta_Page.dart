import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class EmAltaPage extends StatefulWidget {
  @override
  _EmAltaPageState createState() => _EmAltaPageState();
}

class _EmAltaPageState extends State<EmAltaPage> {
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
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: size.width,
                height: size.height * .07,
                color: AppColors.backGroundApp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding( padding: EdgeInsets.only(right: size.width * 0.034/2) ),
                    Column(
                      children: [
                        Container(
                          width: size.width * 0.146,
                          height: size.height * 0.047,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.backGroundApp,
                              ),
                              child: Image.asset(
                                AppImages.homepage,
                                width: size.width * 0.19,
                                height: size.height * 0.095,
                                //width: size.width * .1,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/home');
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Text(
                            'Home',
                            style: TextStyle(fontSize: 10, color: Colors.white38),
                          ),
                        )
                      ],
                    ),
                    Padding( padding: EdgeInsets.only(left: size.width * 0.034) ),
                    Column(
                      children: [
                        Container(
                          width: size.width * 0.146,
                          height: size.height * 0.047,
                          child: TextButton(
                            child: Image.asset(
                              AppImages.searchIcon,
                              width: size.width * 0.19,
                              height: size.height * 0.095,
                              //width: size.width * .1,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Text(
                            'Pesquisa',
                            style: TextStyle(fontSize: 10, color: Colors.white38),
                          ),
                        )
                      ],
                    ),
                    Padding( padding: EdgeInsets.only(left: size.width * 0.034) ),
                    Container(
                      width: size.width * 0.19,
                      height: size.height * 0.095,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.backGroundApp,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150)),
                            child: Image.asset(
                              AppImages.newPost,
                              width: size.width * 0.097,
                              height: size.height * 0.047,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/newpost');
                          }),
                    ),
                    Padding( padding: EdgeInsets.only(left: size.width * 0.034) ),
                    Column(
                      children: [
                        Container(
                          width: size.width * 0.146,
                          height: size.height * 0.047,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.backGroundApp,
                              ),
                              child: Image.asset(
                                AppImages.emAlta,
                                width: size.width * 0.19,
                                height: size.height * 0.095,
                                color:  Colors.white,
                                //width: size.width * .1,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/emAlta');
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Text(
                            'Em alta',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Padding( padding: EdgeInsets.only(left: size.width * 0.034) ),
                    Container(
                      width: size.width * 0.19,
                      height: size.height * 0.095,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.backGroundApp,
                          ),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              AppImages.perfilImage,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/perfil');
                          }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),

        // Barra Inferior:
    );
  }
}
