import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    User user = FirebaseAuth.instance.currentUser;


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
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('PostsSalvos')
                  .snapshots(),
              builder: (context, snapshot) {
                List<DocumentSnapshot> itensSalvos =
                snapshot.data.docs.reversed.toList();

                return
                  ListView.builder(
                      itemCount: itensSalvos.length,
                      itemBuilder: (context, index) {
                        if (snapshot.data.docs[index]['userUid'].contains(user.uid)) {
                          return
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 25,top: 20),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)),
                                      padding: EdgeInsets.all(0.0),
                                      primary: Colors.white,
                                    ),

                                    //AppColors.backGroundApp,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        snapshot.data.docs[index]['imageURL'],
                                        fit: BoxFit.cover,
                                        width: 170,
                                        height: 125,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),

                              ],
                            );
                        }
                        else {
                          return Stack(
                            children: [
                              Column()
                            ],
                          );
                        }
                      });
              }
          ),
        ],
      ),
    );
  }
}