import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appteste/models/chatMessage_model.dart';

class MensagemPage extends StatefulWidget {
  @override
  _MensagemPageState createState() => _MensagemPageState();
}

class _MensagemPageState extends State<MensagemPage> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    List<ChatMessage> messages = [
      ChatMessage(messageContent: "Bom dia Marcelo, como vai?", messageType: "sender"),
      ChatMessage(messageContent: "Tenho novidades para te falar", messageType: "sender"),
      ChatMessage(messageContent: "Eu to bem Ana!", messageType: "receiver"),
      ChatMessage(messageContent: "Conta aí as novidades!", messageType: "receiver"),

    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backGroundApp,
        centerTitle: true,
        leading: IconButton(
            icon: Image.asset(AppImages.leftArrow),
            onPressed: (){
              Navigator.pop(context);
            }),
        title: Text('Sample',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        actions: [
          Container(
            width: w*0.15,
            child: IconButton(
              onPressed: (){},
              icon: CircleAvatar(
                backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/5.jpg"),
                maxRadius: 20,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: AppColors.backGroundApp),
          ),
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: (messages[index].messageType  == "receiver"?AppGradients.linearteste:AppGradients.grey),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15, color: Colors.white),),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.all(w *0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Color.fromRGBO(29, 29, 29, 1),
              ),
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,

              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        gradient: AppGradients.linearteste,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        onPressed: (){},
                        padding: EdgeInsets.all(w*0.013),
                        icon: Image.asset(AppImages.camera5, color: Colors.white,)
                      )
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Mensagem...",
                          hintStyle: TextStyle(color: Color.fromRGBO(79, 79, 79, 1)),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){},
                    child: Icon(Icons.send,color: Colors.white,size: 25,),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}
