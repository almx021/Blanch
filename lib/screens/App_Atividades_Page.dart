import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

import 'App_Account_Page.dart';

class AtividadesPage extends StatefulWidget {
  @override
  _AtividadesPageState createState() => _AtividadesPageState();
}

class _AtividadesPageState extends State<AtividadesPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
          Divider(),
          Container(
            decoration: BoxDecoration(color: AppColors.backGroundApp),
          ),
          Column(
            children: [
              Container(
                  width: size.width,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0.0),
                            minimumSize: Size(25.0, 25.0),
                          ),
                          onPressed: () {},
                          child: CircleAvatar(
                              radius: 25.0,
                              backgroundImage: AssetImage(
                                AppImages.perfilImage,
                              )),
                        ),
                        Container(
                            width: size.width - 70,
                            padding: EdgeInsets.only(left: 0),
                            child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/PerfilOutroUsuario');
                              },
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GradientText("@JuliaGoncalves",
                                          gradient: AppGradients.orangelinear,
                                          style: TextStyle(
                                              fontSize: AdaptiveTextSize()
                                                  .getadaptiveTextSize(
                                                      context, 12),
                                              fontWeight: FontWeight.w500)),
                                      Padding(
                                          padding: EdgeInsets.only(top: 3.0)),
                                      Text("Júlia Gonçalves seguiu voçê",
                                          style: TextStyle(
                                              fontSize: AdaptiveTextSize()
                                                  .getadaptiveTextSize(
                                                      context, 14),
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  )),
                            )),
                      ],
                    ),
                  )),
              Container(
                  width: size.width,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0.0),
                            minimumSize: Size(25.0, 25.0),
                          ),
                          onPressed: () {},
                          child: CircleAvatar(
                              radius: 25.0,
                              backgroundImage: AssetImage(
                                AppImages.perfilImage,
                              )),
                        ),
                        Container(
                            width: size.width - 70,
                            padding: EdgeInsets.only(left: 0),
                            child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GradientText("@JuliaGoncalves",
                                              gradient:
                                                  AppGradients.orangelinear,
                                              style: TextStyle(
                                                  fontSize: AdaptiveTextSize()
                                                      .getadaptiveTextSize(
                                                          context, 12),
                                                  fontWeight: FontWeight.w500)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 3.0)),
                                          Text(
                                              "Júlia Gonçalves curtiu sua \npublicação",
                                              style: TextStyle(
                                                  fontSize: AdaptiveTextSize()
                                                      .getadaptiveTextSize(
                                                          context, 14),
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      )),
                                  Spacer(
                                    flex: 2,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                      AppImages.publiPastel,
                                      width: 70,
                                      height: 70,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
