import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backGroundApp,
          automaticallyImplyLeading: false,
          title: GradientText(
            'BLANCH',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            gradient: AppGradients.linearinverso,
          ),
          actions: [
            Container(
              width: 60,
              height: 80,
              child: FlatButton(
                  child: Image.asset(
                    AppImages.notification,
                    width: size.width * .1,
                  ),
                  color: AppColors.backGroundApp,
                  onPressed: () {
                    Navigator.pushNamed(context, '/atividades');
                  }),
            ),
            Container(
              width: 60,
              height: 80,
              child: FlatButton(
                  child: Image.asset(
                    AppImages.chatApp,
                    width: size.width * .1,
                  ),
                  color: AppColors.backGroundApp,
                  onPressed: () {
                    Navigator.pushNamed(context, '/chat');
                  }),
            ),
            Container(
              width: 60,
              height: 80,
              child: FlatButton(
                  child: Image.asset(
                    AppImages.settingsApp,
                    width: size.width * .1,
                  ),
                  color: AppColors.backGroundApp,
                  onPressed: () {
                    Navigator.pushNamed(context, '/configs');
                  }),
            ),
          ],
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
                    width: 80,
                    height: 20,
                    child:  IconButton(
                      icon: Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text('Home',
                      style: TextStyle(fontSize: 15, color: Colors.white),
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
                    child: Text('Pesquisa',
                      style: TextStyle(fontSize: 13, color: Colors.white38),
                    ),
                  )
                ],
              ),
              Container(
                width: 80,
                height: 80,
                child: FlatButton(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(150)),
                      child: Image.asset(
                      AppImages.newPost,
                      width: 80,
                      height: 80,
                    ),),
                    color: AppColors.backGroundApp,
                    onPressed: () {
                      Navigator.pushNamed(context, '/newpost');
                    }),
              ),
              Column(
                children: [
                  Container(
                    width: 60,
                    height: 35,
                    child: FlatButton(
                        child: Image.asset(
                          AppImages.emAlta,
                          width: size.width * .1,
                        ),
                        color: AppColors.backGroundApp,
                        onPressed: () {}),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Text('Em alta',
                      style: TextStyle(fontSize: 12, color: Colors.white38),
                    ),
                  )
                ],
              ),
              Container(
                width: 80,
                height: 80,
                child: FlatButton(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        AppImages.perfilImage,
                      ),
                    ),
                    color: AppColors.backGroundApp,
                    onPressed: () {}),
              ),

            ],
          ),
        ));
  }
}
