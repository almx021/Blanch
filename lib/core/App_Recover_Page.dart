import 'package:flutter/material.dart';

import 'App_Gradients.dart';
import 'App_Images.dart';

class RecoverPage extends StatefulWidget {
  @override
  _RecoverPageState createState() => _RecoverPageState();
}

class _RecoverPageState extends State<RecoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(gradient: AppGradients.linear)),
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 0.0),
            child: Column(
              children: [
                FlatButton(
                    color: Colors.transparent,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.transparent)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Container(
                            child: Image.asset(
                              AppImages.logo,
                              height: 65.0,
                              width: 65.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Text(
                            'BLANCH',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w100),
                          ),
                        )
                      ],
                    )
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 125.0, bottom: 30.0),
                      child: Text(
                        'RECUPERAR SENHA',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 70.0),
                      child: Text(
                        'informe o email da sua conta',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),

                    Divider(),

                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.white,
                            )),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 17.0),
                      ),
                    ),

                    Divider(),
                    Divider(),

                    Container(
                      height: 70.0,
                      width: 150.0,
                      padding: EdgeInsets.only(top: 5.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.white)),
                        color: Colors.transparent,
                        onPressed: () {},
                        child: Text(
                          'Enviar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 27.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),


                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
