import 'package:flutter/material.dart';

class Logos {
  static Widget buildMiniLogo(BuildContext context, double screenWidth,
      double screenHeight, String logo) {
    return Padding(
        padding:
            EdgeInsets.only(top: 0.08 * screenWidth, left: 0.03 * screenWidth),
        child: Container(
            width: 0.4 * screenWidth,
            height: 0.4 * screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.transparent)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      logo,
                      width: 0.165 * screenWidth,
                      height: 0.165 * screenWidth,
                    )),
                Text("BLANCH",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: (screenWidth * screenHeight) < 190000.0
                            ? 19.0
                            : 21.0,
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                              color: Colors.blueGrey[900],
                              offset: Offset(0.3, 0.5),
                              blurRadius: 1.5)
                        ])),
              ],
            )));
  }
}
