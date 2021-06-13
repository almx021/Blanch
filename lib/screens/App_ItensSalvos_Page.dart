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
                  icon: Image.asset(AppImages.leftArrow, width: 25),
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
                  Padding(padding: EdgeInsets.only(left: 25),
                   child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(0.0),
                      color: Colors.white,
                      //AppColors.backGroundApp,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          AppImages.PubliPastel,
                          fit: BoxFit.cover,
                          width: 170,
                          height: 125,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(0.0),
                      color: Colors.white,
                      //AppColors.backGroundApp,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          AppImages.PubliPastel,
                          fit: BoxFit.cover,
                          width: 170,
                          height: 125,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 25),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(0.0),
                        color: Colors.white,
                        //AppColors.backGroundApp,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            AppImages.PubliPastel,
                            fit: BoxFit.cover,
                            width: 170,
                            height: 125,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(0.0),
                        color: Colors.white,
                        //AppColors.backGroundApp,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            AppImages.PubliPastel,
                            fit: BoxFit.cover,
                            width: 170,
                            height: 125,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 25),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(0.0),
                        color: Colors.white,
                        //AppColors.backGroundApp,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            AppImages.PubliPastel,
                            fit: BoxFit.cover,
                            width: 170,
                            height: 125,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(0.0),
                        color: Colors.white,
                        //AppColors.backGroundApp,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            AppImages.PubliPastel,
                            fit: BoxFit.cover,
                            width: 170,
                            height: 125,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
