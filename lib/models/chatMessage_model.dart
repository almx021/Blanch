import 'dart:io';

import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({@required this.messageContent, @required this.messageType});
}

class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage);
  final Function({String text, File imgFile}) sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final TextEditingController _controller = TextEditingController();
  bool _isComposing = false;
  void reset() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    final _picker = ImagePicker();
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                gradient: AppGradients.orangelinear,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                padding: EdgeInsets.all(w * 0.013),
                icon: Image.asset(
                  AppImages.camera5,
                  color: Colors.white,
                ),
                onPressed: () async {
                  final PickedFile imgFile =
                      await _picker.getImage(source: ImageSource.gallery);
                  if (imgFile == null) return;
                  widget.sendMessage(imgFile: File(imgFile.path));
                },
              )),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: TextField(
            controller: _controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: "Mensagem...",
                hintStyle: TextStyle(color: Color.fromRGBO(79, 79, 79, 1)),
                border: InputBorder.none),
            onChanged: (text) {
              setState(() {
                _isComposing = text.isNotEmpty;
              });
            },
            onSubmitted: (text) {
              widget.sendMessage(text: text);
              reset();
            },
          ),
        ),
        SizedBox(
          width: 15,
        ),
        IconButton(
          color: Colors.white,
          onPressed: _isComposing
              ? () {
                  widget.sendMessage(text: _controller.text);
                  reset();
                }
              : null,
          icon: Icon(
            Icons.send,
            color: _isComposing ? Colors.white : Colors.grey,
            size: 25,
          ),
          //color: Colors.transparent,
          //elevation: 0,
        ),
      ],
    );
  }
}
