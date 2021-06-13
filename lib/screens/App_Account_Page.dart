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
              child: TextButton(
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
              child: TextButton(
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
    );
  }
}
