import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}
class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backGroundApp,
        centerTitle: true,
        leading: IconButton(
            icon: Image.asset(AppImages.leftArrow, width: 25),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Mensagens',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(color: AppColors.backGroundApp)),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 22.0)),
                Container(
                  width: size.width * 0.9,
                  child: TextField(
                    style: TextStyle(
                        fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 14),
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 9.0, right: 9.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                            )),
                        prefixIconConstraints: BoxConstraints(
                          minHeight: 16,
                          minWidth: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(12),
                        fillColor: Color(0xff282828),
                        filled: true,
                        hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                        hintText: 'Pesquisar'),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 19.0)),
                Container(
                  width: size.width,
                  height: 60,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/men/5.jpg"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9.0, top: 3.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("João Pedro",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  Padding(padding: EdgeInsets.only(top: 3.0)),
                                  Text("Olá, tudo bem? · 3 min",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 13),
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mensagens');
                      }),
                ),
                Padding(padding: EdgeInsets.only(top:6.0)),
                Container(
                  width: size.width,
                  height: 60,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/men/80.jpg"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9.0, top: 3.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Cesar Ramalho",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  Padding(padding: EdgeInsets.only(top: 3.0)),
                                  Text("Fala cara, aquela recei... · 22 min",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 13),
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mensagens');
                      }),
                ),
                Padding(padding: EdgeInsets.only(top:6.0)),
                Container(
                  width: size.width,
                  height: 60,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/women/23.jpg"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9.0, top: 3.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Alessanda Ribeiro",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  Padding(padding: EdgeInsets.only(top: 3.0)),
                                  Text("Cara, sobre aquela coxin... · 5 h",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 13),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mensagens');
                      }),
                ),
                Padding(padding: EdgeInsets.only(top:6.0)),
                Container(
                  width: size.width,
                  height: 60,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/men/14.jpg"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9.0, top: 3.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Erick Silva",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  Padding(padding: EdgeInsets.only(top: 3.0)),
                                  Text("5 novas mensagens · 3 d",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 13),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mensagens');
                      }),
                ),
                Padding(padding: EdgeInsets.only(top:6.0)),
                Container(
                  width: size.width,
                  height: 60,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/men/67.jpg"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9.0, top: 3.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Carlos Chen",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  Padding(padding: EdgeInsets.only(top: 3.0)),
                                  Text("Certo, boa noite Carlos · 4 sem",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 13),
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mensagens');
                      }),
                ),
                Padding(padding: EdgeInsets.only(top:6.0)),
                Container(
                  width: size.width,
                  height: 60,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/women/41.jpg"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9.0, top: 3.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Roberta Camargo",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  Padding(padding: EdgeInsets.only(top: 3.0)),
                                  Text("Olá, tudo bem? · 50 sem",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 13),
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mensagens');
                      }),
                ),
                Padding(padding: EdgeInsets.only(top:6.0)),
                Container(
                  width: size.width,
                  height: 60,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/men/69.jpg"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9.0, top: 3.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("César Ramalho",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  Padding(padding: EdgeInsets.only(top: 3.0)),
                                  Text("Olá, tudo bem? · 50 sem",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 13),
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mensagens');
                      }),
                ),
                Padding(padding: EdgeInsets.only(top:6.0)),
                Container(
                  width: size.width,
                  height: 60,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/women/43.jpg"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9.0, top: 3.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Sheila Cristina",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  Padding(padding: EdgeInsets.only(top: 3.0)),
                                  Text("Olá, tudo bem? · 50 sem",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 13),
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mensagens');
                      }),
                ),
                Padding(padding: EdgeInsets.only(top:6.0)),
                Container(
                  width: size.width,
                  height: 60,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/men/87.jpg"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9.0, top: 3.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("José Ricardo",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  Padding(padding: EdgeInsets.only(top: 3.0)),
                                  Text("Olá, tudo bem? · 50 sem",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 13),
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mensagens');
                      }),
                ),
                Padding(padding: EdgeInsets.only(top:6.0)),
                Container(
                  width: size.width,
                  height: 60,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/men/47.jpg"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9.0, top: 3.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ronaldo Lemos",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  Padding(padding: EdgeInsets.only(top: 3.0)),
                                  Text("Olá, tudo bem? · 50 sem",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 13),
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mensagens');
                      }),
                ),
                Padding(padding: EdgeInsets.only(top:6.0)),
                Container(
                  width: size.width,
                  height: 60,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/men/83.jpg"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9.0, top: 3.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Carlos Magalhães",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  Padding(padding: EdgeInsets.only(top: 3.0)),
                                  Text("Olá, tudo bem? · 50 sem",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 13),
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mensagens');
                      }),
                ),
                Padding(padding: EdgeInsets.only(top:6.0)),
                Container(
                  width: size.width,
                  height: 60,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backGroundApp,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://randomuser.me/api/portraits/women/49.jpg"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9.0, top: 3.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Carla Silva",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  Padding(padding: EdgeInsets.only(top: 3.0)),
                                  Text("Olá, tudo bem? · 50 sem",
                                      style: TextStyle(
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 13),
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mensagens');
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
