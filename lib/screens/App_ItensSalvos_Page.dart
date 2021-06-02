import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/App_Colors.dart';
import '../core/App_Images.dart';

class ItensSalvosPage extends StatefulWidget {
  const ItensSalvosPage({Key key}) : super(key: key);

  @override
  _ItensSalvosPageState createState() => _ItensSalvosPageState();
}

class _ItensSalvosPageState extends State<ItensSalvosPage> {
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
        title: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(right: 0.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(AppImages.leftArrow),
                )),
            Text(
              'Itens Salvos',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.backGroundApp),
          ),
          Column(
            children: [
              Divider(),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(25)),
                  Container(
                    width: 165,
                    height: 125,
                    child: FlatButton(
                      color: AppColors.backGroundApp,
                      child: Image.asset(
                        AppImages.Publi,
                        height: 125,
                        width: 500,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: 165,
                    height: 125,
                    child: FlatButton(
                      color: AppColors.backGroundApp,
                      child: Image.asset(
                        AppImages.PubliPastel,
                        height: 125,
                        width: 500,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              Divider(),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(25)),
                  Container(
                    width: 165,
                    height: 125,
                    child: FlatButton(
                      color: AppColors.backGroundApp,
                      child: Image.asset(
                        AppImages.PubliRosquinha,
                        height: 125,
                        width: 500,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: 165,
                    height: 125,
                    child: FlatButton(
                      color: AppColors.backGroundApp,
                      child: Image.asset(
                        AppImages.PubliPeixe,
                        height: 125,
                        width: 500,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: bottomNavegationBar,
    );
  }
}
