import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

import '../core/App_Colors.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundApp,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundApp,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(AppImages.leftArrow, width: 25),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 75.5, bottom: 20),
                child: GradientText(
                  'BLANCH',
                  style: TextStyle(fontSize: 32, height: 2.5),
                  gradient: AppGradients.linear,
                ),
              ),
            ]),
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Container(
          //Criar receita - text

          padding: EdgeInsets.only(top: 25, bottom: 15),
          child: GradientText(
            'CRIAR RECEITA',
            style: TextStyle(fontSize: 32, height: 2.5),
            gradient: AppGradients.linear,
          ),
          alignment: Alignment.center,
        ),

        //Imagem

        Container(
            decoration: BoxDecoration(
                color: Color(0xFF343434),
                border: Border.all(
                  color: Color(0xFF343434),
                ),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            width: 300,
            height: 250,

            //color: Color(0xFF343434),
            child: Image.asset(
              AppImages.camera5,
              height: 30.0,
              width: 30.0,
            )),

        //Escolher imagem

        Container(
            width: 250,
            height: 40.79,
            margin: EdgeInsets.only(top: 25),
            //c
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF343434),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(
                        color: Color(0xFF343434),
                      )),
                ),
                onPressed: () {},
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 27),
                  ),
                  Icon(Icons.image_outlined, color: Colors.white),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Text(
                    'Escolher imagens',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ]))),
        //Descrição da receita: textfield
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 29, top: 40),
          ),
          Text('Descrição da receita:',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 18,
                color: Colors.white,
              )),
        ]),
        Container(
          width: 390,
          child: TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF9B9B9B),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF9B9B9B)),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelStyle: TextStyle(
                  color: Colors.white,
                )),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),

        //Tempo de preparo e porções

        Container(
            width: 310,
            height: 264,
            margin: EdgeInsets.only(top: 48),
            decoration: BoxDecoration(
                color: Color(0xFF343434),
                border: Border.all(
                  color: Color(0xFF343434),
                ),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              children: [
                Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 55, top: 72),
                  ),
                  Image.asset(
                    AppImages.relogio,
                    height: 25.0,
                    width: 25.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Text(
                    'Tempo de preparo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ]),
                Row(children: [
                  Container(
                    width: 75,
                    margin: EdgeInsets.only(left: 92, right: 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF9B9B9B),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9B9B9B)),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                  Text(
                    'minutos',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300),
                  )
                ]),
                Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 90, top: 72),
                  ),
                  Image.asset(
                    AppImages.prato,
                    height: 25.0,
                    width: 25.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Text(
                    'Porções',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ]),
                Row(children: [
                  Container(
                    width: 75,
                    margin: EdgeInsets.only(left: 92, right: 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF9B9B9B),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9B9B9B)),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                  Text(
                    'porções',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300),
                  )
                ]),
              ],
            )),

        //Escolha as categorias
        Padding(
          padding: EdgeInsets.only(top: 30),
        ),
        Container(
          width: 331,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Color(0xFF343434),
              child: ExpansionTile(
                  title: Text("Escolha as categorias",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          color: Colors.white)))),
        ),
        Row(children: [
          Padding(padding: EdgeInsets.only(left: 54)),
          TextButton(
            onPressed: () {},
            child: Image.asset(
              AppImages.salgado_botao,
              height: 30.0,
              width: 80.0,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Image.asset(
              AppImages.crocante_botao,
              height: 30.0,
              width: 80.0,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Image.asset(
              AppImages.pratico_botao,
              height: 30.0,
              width: 80.0,
            ),
          ),
        ]),
        Row(children: [
          Padding(padding: EdgeInsets.only(left: 90)),
          TextButton(
            onPressed: () {},
            child: Image.asset(
              AppImages.rende_muito_botao,
              height: 35.0,
              width: 90.0,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Image.asset(
              AppImages.rapido_de_fazer_botao,
              height: 35.0,
              width: 90.0,
            ),
          ),
        ]),
        Container(
            width: 331,
            height: 740,
            margin: EdgeInsets.only(top: 29),
            decoration: BoxDecoration(
                color: Color(0xFF343434),
                border: Border.all(
                  color: Color(0xFF343434),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 110, top: 72),
                  ),
                  Text(
                    'Ingredientes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ]),
                Row(children: [
                  Container(
                    width: 293,
                    height: 293,
                    margin: EdgeInsets.only(left: 17, right: 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 125.0,
                          ),
                          filled: true,
                          fillColor: Color(0xFF9B9B9B),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9B9B9B)),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                ]),
                Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 90, top: 72),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                  ),
                  Text(
                    'Preparo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ]),
                Row(children: [
                  Container(
                    width: 293,
                    height: 293,
                    margin: EdgeInsets.only(left: 17, right: 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 125.0,
                          ),
                          filled: true,
                          fillColor: Color(0xFF9B9B9B),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9B9B9B)),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                ]),
              ],
            )),
        Padding(
          padding: EdgeInsets.only(top: 27),
        ),
        Container(
            width: 179,
            height: 51,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF343434),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(
                        color: Color(0xFF343434),
                      )),
                ),
                onPressed: () {},
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                  ),
                  Text(
                    'Concluir',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ]))),
        Padding(
          padding: EdgeInsets.only(bottom: 36),
        ),
      ])),
    );
  }
}
