import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/App_Colors.dart';
import '../core/App_Images.dart';
import 'App_Detalhes_do_Post_Page.dart';

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
                if(!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator(),);
                }
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
                                  padding: EdgeInsets.only(left: 50,top: 20),
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
                                        width: 300 ,
                                        height: 200,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                          DetalhesPostPage(
                                            imageURL: snapshot.data.docs[index]['imageURL'],
                                            postId: snapshot.data.docs[index].id,
                                            name: snapshot.data.docs[index]['user'],
                                            descricaoDaReceita: snapshot.data.docs[index]['descricaoDaReceita'],
                                            username: snapshot.data.docs[index]['username'],
                                            userPhotoURL: snapshot.data.docs[index]['userImage'],
                                            porcoes: snapshot.data.docs[index]['porcoes'],
                                            modoDePreparo: snapshot.data.docs[index]['preparo'],
                                            tempoDePreparo: snapshot.data.docs[index]['tempoDePreparo'],
                                            ingredientes: snapshot.data.docs[index]['ingredientes'],
                                            curtidas: snapshot.data.docs[index]['likes'].length,
                                            isLiked: snapshot.data.docs[index]['likes'].containsKey(user.uid)?false:true,
                                            isSaved:  snapshot.data.docs[index]['saves'].containsKey(user.uid)?false:true,
                                            userUID: user.uid,
                                          )));

                                    },
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