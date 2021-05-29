import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/material.dart';
import '../core/App_Colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bottomNavegationBar = Container(
      width: size.width,
      height: size.height * .07,
      color: AppColors.backGroundApp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 80,
                height: 20,
                child: IconButton(
                  icon: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                width: 60,
                height: 20,
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white38,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 17),
                child: Text(
                  'Pesquisa',
                  style: TextStyle(fontSize: 13, color: Colors.white38),
                ),
              )
            ],
          ),
          Container(
            width: 80,
            height: 80,
            child: FlatButton(
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(150)),
                  child: Image.asset(
                    AppImages.newPost,
                    width: 80,
                    height: 80,
                  ),
                ),
                color: AppColors.backGroundApp,
                onPressed: () {
                  Navigator.pushNamed(context, '/newpost');
                }),
          ),
          Column(
            children: [
              Container(
                width: 60,
                height: 35,
                child: FlatButton(
                    child: Image.asset(
                      AppImages.emAlta,
                      width: size.width * .1,
                    ),
                    color: AppColors.backGroundApp,
                    onPressed: () {}),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text(
                  'Em alta',
                  style: TextStyle(fontSize: 12, color: Colors.white38),
                ),
              )
            ],
          ),
          Container(
            width: 80,
            height: 80,
            child: FlatButton(
                child: Image.asset(
                  AppImages.perfilImage,
                  width: size.width * .1,
                ),
                color: AppColors.backGroundApp,
                onPressed: () {}),
          ),
        ],
      ),
    );

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
            'Conta',
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
              child: FlatButton(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Alterar dados de cadastro",
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
              child: FlatButton(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Excluir conta",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.red.shade900,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ]),
      bottomNavigationBar: bottomNavegationBar,
    );
  }
}
