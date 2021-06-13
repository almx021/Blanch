import 'package:appteste/core/App_Colors.dart';
import 'package:appteste/core/App_Images.dart';
import 'package:appteste/core/App_Gradients.dart';
import 'package:flutter/material.dart';
import '../core/App_Colors.dart';

class UnicornOutlineButton extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;

  UnicornOutlineButton({
    @required double strokeWidth,
    @required double radius,
    @required Gradient gradient,
    @required Widget child,
    @required VoidCallback onPressed,
  })  : this._painter = _GradientPainter(
            strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        this._child = child,
        this._callback = onPressed,
        this._radius = radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(_radius),
          onTap: _callback,
          child: Container(
            constraints: BoxConstraints(minWidth: 88, minHeight: 48),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter(
      {@required double strokeWidth,
      @required double radius,
      @required Gradient gradient})
      : this.strokeWidth = strokeWidth,
        this.radius = radius,
        this.gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}

class AlterarDadosPage extends StatefulWidget {
  const AlterarDadosPage({Key key}) : super(key: key);

  @override
  _AlterarDadosPageState createState() => _AlterarDadosPageState();
}

class _AlterarDadosPageState extends State<AlterarDadosPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backGroundApp,
        centerTitle: true,
        leading: IconButton(
            icon: Image.asset(AppImages.leftArrow),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Alterar Dados',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(color: AppColors.backGroundApp)),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 35)),
                Align(
                    alignment: FractionalOffset(0.1, 0.6),
                    child: Text("Alterar E-mail",
                        style: TextStyle(
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 18),
                            color: Colors.white,
                            fontWeight: FontWeight.w500))),
                Padding(padding: EdgeInsets.only(top: 20)),
                Align(
                    alignment: FractionalOffset(0.2, 0.6),
                    child: Text("Digite o novo e-mail",
                        style: TextStyle(
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 14),
                            color: Colors.white,
                            fontWeight: FontWeight.w500))),
                Padding(padding: EdgeInsets.only(top: 10)),
                Align(
                  alignment: FractionalOffset(0.3, 0.6),
                  child: Container(
                    width: size.width * 0.7,
                    child: TextField(
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 14),
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 9.0, right: 9.0),
                            child: Icon(
                              Icons.alternate_email_rounded,
                              color: Colors.grey,
                            )),
                        prefixIconConstraints: BoxConstraints(
                          minHeight: 13,
                          minWidth: 13,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(12),
                        fillColor: Color(0xff282828),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Align(
                    alignment: FractionalOffset(0.2, 0.6),
                    child: Text("Digite sua senha",
                        style: TextStyle(
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 14),
                            color: Colors.white,
                            fontWeight: FontWeight.w500))),
                Padding(padding: EdgeInsets.only(top: 10)),
                Align(
                  alignment: FractionalOffset(0.3, 0.6),
                  child: Container(
                    width: size.width * 0.7,
                    child: TextField(
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 14),
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 9.0, right: 9.0),
                            child: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            )),
                        prefixIconConstraints: BoxConstraints(
                          minHeight: 13,
                          minWidth: 13,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(12),
                        fillColor: Color(0xff282828),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 25)),
                Align(
                  alignment: Alignment.center,
                  child: UnicornOutlineButton(
                    strokeWidth: 1,
                    radius: 24,
                    gradient: AppGradients.orangelinear,
                    child: ShaderMask(
                      shaderCallback: (Rect rect) {
                        return (AppGradients.orangelinear).createShader(rect);
                      },
                      child: Text(
                        'Alterar',
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 35)),
                Align(
                    alignment: FractionalOffset(0.1, 0.6),
                    child: Text("Alterar Senha",
                        style: TextStyle(
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 18),
                            color: Colors.white,
                            fontWeight: FontWeight.w500))),
                Padding(padding: EdgeInsets.only(top: 20)),
                Align(
                    alignment: FractionalOffset(0.2, 0.6),
                    child: Text("Digite sua senha atual",
                        style: TextStyle(
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 14),
                            color: Colors.white,
                            fontWeight: FontWeight.w500))),
                Padding(padding: EdgeInsets.only(top: 10)),
                Align(
                  alignment: FractionalOffset(0.3, 0.6),
                  child: Container(
                    width: size.width * 0.7,
                    child: TextField(
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 14),
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 9.0, right: 9.0),
                            child: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            )),
                        prefixIconConstraints: BoxConstraints(
                          minHeight: 13,
                          minWidth: 13,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(12),
                        fillColor: Color(0xff282828),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Align(
                    alignment: FractionalOffset(0.2, 0.6),
                    child: Text("Digite sua nova senha",
                        style: TextStyle(
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 14),
                            color: Colors.white,
                            fontWeight: FontWeight.w500))),
                Padding(padding: EdgeInsets.only(top: 10)),
                Align(
                  alignment: FractionalOffset(0.3, 0.6),
                  child: Container(
                    width: size.width * 0.7,
                    child: TextField(
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 14),
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 9.0, right: 9.0),
                            child: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            )),
                        prefixIconConstraints: BoxConstraints(
                          minHeight: 13,
                          minWidth: 13,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(12),
                        fillColor: Color(0xff282828),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Align(
                    alignment: FractionalOffset(0.2, 0.6),
                    child: Text("Confirme sua nova senha",
                        style: TextStyle(
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 14),
                            color: Colors.white,
                            fontWeight: FontWeight.w500))),
                Padding(padding: EdgeInsets.only(top: 10)),
                Align(
                  alignment: FractionalOffset(0.3, 0.6),
                  child: Container(
                    width: size.width * 0.7,
                    child: TextField(
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 14),
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 9.0, right: 9.0),
                            child: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            )),
                        prefixIconConstraints: BoxConstraints(
                          minHeight: 13,
                          minWidth: 13,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(12),
                        fillColor: Color(0xff282828),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 25)),
                Align(
                  alignment: Alignment.center,
                  child: UnicornOutlineButton(
                    strokeWidth: 1,
                    radius: 24,
                    gradient: AppGradients.orangelinear,
                    child: ShaderMask(
                      shaderCallback: (Rect rect) {
                        return (AppGradients.orangelinear).createShader(rect);
                      },
                      child: Text(
                        'Alterar',
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 35)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
