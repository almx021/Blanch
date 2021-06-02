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
          backgroundColor: AppColors.backGroundApp,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(AppImages.leftArrow),
          ),
          title: GradientText(
            '            BLANCH            ',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            gradient: AppGradients.linearinverso,
          ),
        ),
        body: SingleChildScrollView(
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

        // Barra Inferior:
        bottomNavigationBar: Container(
          width: size.width,
          height: size.height * .07,
          color: AppColors.backGroundApp,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    width: 80,
                    height: 35,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.backGroundApp,
                        ),
                        child: Container(
                          child: Icon(
                            Icons.home_filled,
                            color: Colors.white38,
                            size: 30,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      'Home',
                      style: TextStyle(fontSize: 12, color: Colors.white38),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 60,
                    height: 20,
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white38,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 17),
                    child: Text(
                      'Pesquisa',
                      style: TextStyle(fontSize: 12, color: Colors.white38),
                    ),
                  )
                ],
              ),
              Container(
                width: 80,
                height: 80,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.backGroundApp,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150)),
                      child: Image.asset(
                        AppImages.newPost,
                        width: 80,
                        height: 80,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/newpost');
                    }),
              ),
              Column(
                children: [
                  Container(
                    width: 60,
                    height: 35,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.backGroundApp,
                        ),
                        child: Image.asset(
                          AppImages.emAlta,
                          width: 80,
                          height: 80,
                          //width: size.width * .1,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/emAlta');
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      'Em alta',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: 80,
                height: 80,
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
        ));
  }
}
