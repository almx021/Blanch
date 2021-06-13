import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:scoped_model/scoped_model.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(body: ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        return Scaffold(
            backgroundColor: AppColors.backGroundApp,
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
                title: Text(
                  '${model.userData["name"]}',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  Container(
                    width: 60,
                    height: 80,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.backGroundApp,
                        ),
                        child: Icon(
                          Icons.bookmarks_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/itensSalvos');
                        }),
                  ),
                ]),
            body: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 25),
                ),
                Container(
                    width: size.width,
                    height: size.height / 8,
                    child: Row(children: [
                      Padding(
                        padding: EdgeInsets.only(left: 155),
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          AppImages.perfilImage,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 99, top: 50),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: AppColors.backGroundApp,
                                minimumSize: Size.fromWidth(0)),
                            child: Image.asset(
                              AppImages.editPerfil,
                              width: 30,
                            ),
                            onPressed: () {}),
                      )
                    ])),
                Padding(padding: EdgeInsets.only(top: 12)),
                Text(
                  '@${model.userData["@"]}',
                  style: TextStyle(color: Colors.white),
                ),
                Padding(padding: EdgeInsets.only(top: 12)),
                Text(
                  '${model.userData["bio"]}',
                  style: TextStyle(color: Colors.white),
                ),
                Padding(padding: EdgeInsets.only(top: 6)),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 50)),
                      Column(children: [
                        Text(
                          '0', //'${model.userData["postagens"]}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'postagens',
                          style: TextStyle(
                              color: Colors.white38,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        )
                      ]),
                      VerticalDivider(
                        color: Colors.white38,
                      ),
                      Column(children: [
                        Text(
                          '0', //'${model.userData["postagens"]}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'seguidores',
                          style: TextStyle(
                              color: Colors.white38,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        )
                      ]),
                      VerticalDivider(
                        color: Colors.white38,
                      ),
                      Column(children: [
                        Text(
                          '0', //'${model.userData["postagens"]}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'seguindo',
                          style: TextStyle(
                              color: Colors.white38,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        )
                      ]),
                    ],
                  ),
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Colors.white38,
                ),
              ]),
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
                        width: 60,
                        height: 40,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.backGroundApp,
                            ),
                            child: Image.asset(
                              AppImages.homepage,
                              width: 80,
                              height: 80,
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
                          style: TextStyle(fontSize: 12, color: Colors.white38),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 40,
                        child: TextButton(
                          child: Image.asset(
                            AppImages.searchIcon,
                            width: 80,
                            height: 80,
                            //width: size.width * .1,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0),
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
                            width: 40,
                            height: 40,
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
                        height: 40,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.backGroundApp,
                            ),
                            child: Image.asset(
                              AppImages.emAlta,
                              width: 80,
                              height: 80,
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
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white38,
                          ),
                        ),
                      ),
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
                        onPressed: () {}),
                  ),
                ],
              ),
            ));
      },
    ));
  }
}
