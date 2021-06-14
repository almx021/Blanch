import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/material.dart';

class EditarPerfilPage extends StatefulWidget {
  const EditarPerfilPage({Key key}) : super(key: key);

  @override
  _EditarPerfilPageState createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backGroundApp,

        leading: IconButton(
            icon: Image.asset(AppImages.leftArrow, width: 25),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Editar Perfil',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(color: AppColors.backGroundApp)),
        ],
      ),
    );
  }
}
