import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/material.dart';
import '../core/App_Colors.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool switched = false;
  bool switched2 = false;
  bool switched3 = false;
  int _value = 1;

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
            'Notificações',
            style: TextStyle(color: Colors.white),
          )),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(color: AppColors.backGroundApp),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 25, left: 15.0, right: 15.0),
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Desativar todas as notificações",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                      Switch(
                        value: switched,
                        onChanged: (value) {
                          setState(() {
                            switched = value;
                          });
                        },
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.deepOrangeAccent,
                        activeColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  width: size.width,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Curtidas e comentários",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                      Container(
                        height: 30,
                        width: 120,
                        padding: EdgeInsets.only(left: 20.0, right: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Color(0xff282828),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_downward_sharp),
                              iconSize: 15.0,
                              dropdownColor: Color(0xff282828),
                              value: _value,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Todos",
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Seguindo",
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                    child: Text("Desativado",
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500)),
                                    value: 3),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  width: size.width,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Mensagens",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                      Switch(
                        value: switched2,
                        onChanged: (value) {
                          setState(() {
                            switched2 = value;
                          });
                        },
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.deepOrangeAccent,
                        activeColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  width: size.width,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Do Blanch",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                      Switch(
                        value: switched3,
                        onChanged: (value) {
                          setState(() {
                            switched3 = value;
                          });
                        },
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.deepOrangeAccent,
                        activeColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
