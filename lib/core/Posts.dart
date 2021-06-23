import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var curtidas = 0;

    return Container(
      color: AppColors.backGroundApp,
      child: Column(
        children: [
          Divider(),
          Container(
            width: size.width,
            height: size.height * .07,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(),
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Text(
                          'Nome',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                        Text(
                          'postou uma nova receita!',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GradientText(
                        '@usuário',
                        gradient: AppGradients.linear,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                      onPressed: () {}),
                )
              ],
            ),
          ),
          Container(
            height: size.height * .25,
            width: size.width,
            child: Image.asset(
              AppImages.publiPastel,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Text('Curtido por ${curtidas} pessoas',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              GradientText(
                '  #Salgado #Tag1 #Tag2',
                gradient: AppGradients.linear,
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          Row(
            children: [
              Text(
                'Joao Pedro',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              Text(
                'Legenda',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Align(alignment: Alignment.centerRight,
              child: IconButton(
                  icon: Icon(
                    Icons.bookmarks_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {}),),
            ],
          ),
          Row(
            children: [
              Text(
                '@usuário',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              Text(
                'Muito bom!',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'Ver mais',
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                )),
          ),
          Align(alignment: Alignment.bottomRight,
          child: Text(
            'Publicado 15 minutos atrás',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),)
        ],
      ),
    );
  }
}
