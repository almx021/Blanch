import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.backGroundApp,
          title: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 100),
                  child: IconButton(
                    onPressed:() {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(AppImages.leftArrow),
                  )
              ),
              Text('LAchef',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(decoration: BoxDecoration(color: AppColors.backGroundApp),),

    /*   Container(
              child:  Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white38,
                    size: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Pesquisa',
                      labelStyle: TextStyle(color: Colors.white38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      )
                    ),
                  )
                ],
              ),
            ),*/

          ],
        ),


    );
  }
}
