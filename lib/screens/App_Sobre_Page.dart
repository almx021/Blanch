import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/material.dart';
import '../core/App_Colors.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({Key key}) : super(key: key);

  @override
  _SobrePageState createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
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
            icon: Image.asset(AppImages.leftArrow),
          ),
          title: Text(
            'Sobre',
            style: TextStyle(color: Colors.white),
          )),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(color: AppColors.backGroundApp),
        ),
        Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 25)),
            Container(
              width: size.width,
              height: 60,
              child: TextButton(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("O que é o Blanch?",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: size.width,
              height: 60,
              child: TextButton(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Termos de uso",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
