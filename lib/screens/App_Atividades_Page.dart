
import 'package:appteste/screens/App_Configs_Page.dart';
import 'package:appteste/main.dart';
import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/material.dart';



class AtividadesPage extends StatefulWidget {
  @override
  _AtividadesPageState createState() => _AtividadesPageState();
}

class _AtividadesPageState extends State<AtividadesPage> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

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
            Text('Atividades',
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
        bottomNavigationBar: Container(
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
                    child:  IconButton(
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
                    child: Text('Home',
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
                    child: Text('Pesquisa',
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
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(150)),
                      child: Image.asset(
                        AppImages.newPost,
                        width: 80,
                        height: 80,
                      ),),
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
                    child: Text('Em alta',
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
        )


    );
  }
}
