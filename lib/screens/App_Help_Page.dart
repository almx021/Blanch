import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/material.dart';
import '../core/App_Colors.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
            'Ajuda',
            style: TextStyle(color: Colors.white),
          )),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(color: AppColors.backGroundApp),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Align(
                alignment: FractionalOffset(0.1, 0.6),
                child: Text("Relatar um problema",
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
              ),
              Padding(padding: EdgeInsets.only(top: 45)),
              Container(
                width: size.width * 0.85,
                child: TextField(
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                  maxLines: 60,
                  minLines: 1,
                  decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(9),
                      fillColor: Color(0xff282828),
                      filled: true,
                      hintMaxLines: 99,
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                      hintText:
                          'Explique resumidamente o que aconteceu ou o que não está funcionando.'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                      ),
                      icon: Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 16,
                      ),
                      label: Text("Galeria"),
                      onPressed: () {},
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                      ),
                      label: Text("Enviar"),
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 16,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
