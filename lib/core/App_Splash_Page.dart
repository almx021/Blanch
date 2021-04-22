import 'package:flutter/material.dart';
import 'App_Gradients.dart';
import 'App_Images.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Scaffold(
            body:
            Container(
                decoration: BoxDecoration(gradient: AppGradients.linear))
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding( padding: EdgeInsets.only(top: 235, left: 125, right: 125),
                child: Container(
                    child: Image.asset(AppImages.logo, fit: BoxFit.cover, width: 150, height: 150,)),
              ),

              Padding(padding: EdgeInsets.only(left: 85, right: 85, bottom: 295),
                child: Container(
                    child: Text("BLANCH",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 60,
                          color: Colors.white,
                        )
                    )
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
