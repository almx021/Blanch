import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/screens/App_Configs_Page.dart';
import 'package:appteste/main.dart';
import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class AtividadesPage extends StatefulWidget {
  @override
  _AtividadesPageState createState() => _AtividadesPageState();
}

class _AtividadesPageState extends State<AtividadesPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.backGroundApp,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(AppImages.leftArrow, width: 25),
          ),
          title: Text(
            'Atividades',
            style: TextStyle(color: Colors.white),
          )),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.backGroundApp),
          ),
          Column(
            children: [
              Container(
                  height: 50,
                  child: Row(
                    children: [
                      // ignore: deprecated_member_use
                      Container(
                        width: 50,
                        child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(
                                  color: AppColors.backGroundApp,
                                )),
                            color: AppColors.backGroundApp,
                            onPressed: () {},
                            child: CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                  AppImages.perfilImage,
                                ))),
                      ),

                      // ignore: deprecated_member_use
                      RaisedButton(
                          padding: EdgeInsets.all(0.0),
                          color: AppColors.backGroundApp,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Column(children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 200),
                                  child: GradientText(
                                    "@JuliaGoncalves",
                                    gradient: AppGradients.orangelinear,
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(right: 130),
                                    child: Text(
                                      " Júlia Gonçalves seguiu você",
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ])
                            ],
                          )),
                    ],
                  )),
              Padding(padding: EdgeInsets.only(top: 15)),
              Container(
                  height: 50,
                  child: Row(
                    children: [
                      // ignore: deprecated_member_use
                      Container(
                        width: 50,
                        child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(
                                  color: AppColors.backGroundApp,
                                )),
                            color: AppColors.backGroundApp,
                            onPressed: () {},
                            child: CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                  AppImages.perfilImage,
                                ))),
                      ),

                      // ignore: deprecated_member_use
                      RaisedButton(
                          padding: EdgeInsets.all(0.0),
                          color: AppColors.backGroundApp,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Column(children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 182),
                                  child: GradientText(
                                    "@JuliaGoncalves",
                                    gradient: AppGradients.orangelinear,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 62),
                                  child: Text(
                                    " Júlia Gonçalves curtiu sua publição ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ]),
                              Image.asset(AppImages.Publi)
                            ],
                          )),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
