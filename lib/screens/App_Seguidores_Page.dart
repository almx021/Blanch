import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:flutter/material.dart';
import '../core/App_Colors.dart';
import 'package:gradient_text/gradient_text.dart';

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}

class SeguidoresPage extends StatefulWidget {
  const SeguidoresPage({Key key}) : super(key: key);

  @override
  _SeguidoresPageState createState() => _SeguidoresPageState();
}

class _SeguidoresPageState extends State<SeguidoresPage> {
  bool pressGeoON = false;
  bool cmbscritta = false;

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
          'Seguidores',
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
                Padding(padding: EdgeInsets.only(top: size.height * 0.04)),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CircleAvatar(
                          radius: 28.0,
                          backgroundImage: NetworkImage(
                              "https://randomuser.me/api/portraits/men/67.jpg"),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: size.width * 0.03),
                            child: Column(
                              children: [
                                Text("Carlos Chen",
                                    style: TextStyle(
                                        fontSize: AdaptiveTextSize()
                                            .getadaptiveTextSize(context, 16),
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),

                                GradientText("@carloschen",
                                    gradient: AppGradients.orangelinear,
                                    style: TextStyle(
                                        fontSize: AdaptiveTextSize()
                                            .getadaptiveTextSize(context, 15),
                                        fontWeight: FontWeight.w500)),
                              ],
                            )),
                      ]),
                      Padding(
                        padding: EdgeInsets.only(right: size.width * 0.02),
                          child: Container(
                            width: size.width * 0.27,
                            height: size.height * 0.05,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  pressGeoON = !pressGeoON;
                                  cmbscritta = !cmbscritta;
                                });
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: Colors.white10)),
                              ),
                              child: Ink(
                                  decoration: BoxDecoration(
                                    gradient: pressGeoON
                                        ? AppGradients.orangelinear
                                        : LinearGradient(colors: [
                                            Color(0xff282828),
                                            Color(0xff282828)
                                          ]),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Container(
                                    height: 0.05 * size.height,
                                    width: 0.35 * size.width,
                                    alignment: Alignment.center,
                                    child: cmbscritta
                                        ? Text(
                                            "Seguindo",
                                            style: TextStyle(
                                                fontSize: AdaptiveTextSize()
                                                    .getadaptiveTextSize(
                                                        context, 16),
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          )
                                        : Text(
                                            "Seguir",
                                            style: TextStyle(
                                                fontSize: AdaptiveTextSize()
                                                    .getadaptiveTextSize(
                                                        context, 15),
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                  )),
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: size.height * 0.025)),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
