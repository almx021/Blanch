import 'package:appteste/core/App_Gradients.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import '../core/App_Colors.dart';
import 'App_Account_Page.dart';

class DetalhesPostPage extends StatefulWidget {
  const DetalhesPostPage({Key key}) : super(key: key);

  @override
  _DetalhesPostPageState createState() => _DetalhesPostPageState();
}

class _DetalhesPostPageState extends State<DetalhesPostPage> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backGroundApp,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundApp,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(AppImages.leftArrow, width: 25),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 75.5, bottom: 20),
                child: GradientText(
                  'BLANCH',
                  style: TextStyle(fontSize: 32, height: 2.5),
                  gradient: AppGradients.linear,
                ),
              ),
            ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.02, left: size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Align(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://randomuser.me/api/portraits/women/23.jpg"
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.025),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Alessandra Ribeiro',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: AdaptiveTextSize()
                                          .getadaptiveTextSize(context, 14.5)),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.015),
                                    child: Text(
                                      'nova receita!',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(
                                                  context, 14.5)),
                                    )),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: GradientText(
                                '@usuário',
                                gradient: AppGradients.linear,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 15)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: size.width * 0.02),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            onTap: () {}),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.015),
              child: Container(
                height: size.height * 0.3,
                width: size.width,
                child: Image.network(
                  'https://img.itdg.com.br/tdg/images/recipes/000/020/617/354276/354276_original.jpg?mode=crop&width=710&height=400',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          pressed = !pressed;
                        });
                      },
                      icon: pressed
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                      )),
                ]),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmarks_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03, bottom: size.height * 0.01),
              child: Text('Curtido por 5000 pessoas',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 15))),
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.03, right: size.width * 0.03),
                child: Flexible(
                    child: Text("Receita de pastel caseiro, fácil e prático",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 15))))),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03, right: size.width * 0.03),
              child: GradientText(
                'Tags: #Salgado #Crocante #prático #Rápido',
                gradient: AppGradients.linear,
                style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 15)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.05, top: size.height * 0.03),
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.20,
                    decoration: BoxDecoration(
                        gradient: AppGradients.orangelinear,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.03),
                          child: Image.asset(
                            AppImages.relogio,
                            height: size.height * 0.04,
                          ),
                        ),
                        Text("30 minutos",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AdaptiveTextSize()
                                    .getadaptiveTextSize(context, 18)))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: size.width * 0.05, top: size.height * 0.03),
                  child: Container(
                    width: size.width * 0.4,
                    height: size.height * 0.20,
                    decoration: BoxDecoration(
                        gradient: AppGradients.orangelinear,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.03),
                          child: Image.asset(
                            AppImages.prato,
                            height: size.height * 0.04,
                          ),
                        ),
                        Text("15 porções",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AdaptiveTextSize()
                                    .getadaptiveTextSize(context, 18)))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: Align(
                  alignment: Alignment.center,
                  child: GradientText(
                    'Ingredientes',
                    gradient: AppGradients.linear,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AdaptiveTextSize()
                            .getadaptiveTextSize(context, 25)),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03, top: size.height * 0.01),
              child: Flexible(
                child: Text(
                    "3 xícaras de farinha de trigo \n"
                    "1 xícara de água morna (ou um pouco mais) \n"
                    "3 colheres (sopa) de óleo (de soja, milho, girassol ou algodão) \n"
                    "1 colher (sopa) de aguardente \n"
                    "1 colher (sopa) rasa de sal \n"
                    "farinha de trigo para trabalhar a massa\n",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AdaptiveTextSize()
                            .getadaptiveTextSize(context, 17))),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: Align(
                  alignment: Alignment.center,
                  child: GradientText(
                    'Preparo',
                    gradient: AppGradients.linear,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AdaptiveTextSize()
                            .getadaptiveTextSize(context, 25)),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03, top: size.height * 0.01),
              child: Flexible(
                child: Text(
                    "1° Coloque a farinha misturada com o sal em uma vasilha ou uma mesa e abra um buraco no meio. \n"
                    "2° Nesse buraco, coloque o óleo, a aguardente e um pouco de água. \n"
                    "3° Misture a água e a farinha aos poucos, cada vez pegando um pouco mais de farinha da borda do buraco. \n"
                    "4° Quando a massa estiver ficando dura, coloque mais água. \n"
                    "5° A massa deve ficar macia. \n"
                    "6° Use farinha de trigo para trabalhar a massa\n"
                    "7 °Se estiver muito grudenta, coloque mais farinha.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AdaptiveTextSize()
                            .getadaptiveTextSize(context, 17))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.05,
                  left: size.width * 0.08,
                  bottom: size.height * 0.03),
              child: Text("Comentários(2)",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 19))),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.03),
              child: Column(
                children: [
                  Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/men/67.jpg"
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: size.width * 0.03),
                            child: Text('Carlos Chen',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 15))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: size.width * 0.03),
                            child: Text('ontem às 17:45',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 13))),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(left: size.width * 0.03, top: size.height * 0.005,),
                      child: Flexible(
                          child: Text("Muito bom!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 14))))),
                    ],
                  ),
                ],
              ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://randomuser.me/api/portraits/men/14.jpg"
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: size.width * 0.03),
                                child: Text('Erick Silva',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: AdaptiveTextSize()
                                            .getadaptiveTextSize(context, 15))),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: size.width * 0.03),
                                child: Text('ontem às 18:35',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: AdaptiveTextSize()
                                            .getadaptiveTextSize(context, 13))),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(left: size.width * 0.03, top: size.height * 0.005,),
                              child: Flexible(
                                  child: Text("O pastel ficou ótimo!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: AdaptiveTextSize()
                                          .getadaptiveTextSize(context, 14))))),
                        ],
                      ),
                    ],
                  ),
                  ),
              ]
            ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.025, bottom: size.height * 0.05),
            child: Align(
              alignment: Alignment.center,
            child: Container(
              width: size.width * 0.8,
              child: TextField(
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(9),
                    fillColor: Color(0xff282828),
                    filled: true,
                    isCollapsed: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    hintStyle: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                    hintText:
                    'Adicionar comentário...'),
              ),
            )
            ),
            ),
          ],
        ),
      ),
    );
  }
}