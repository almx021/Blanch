import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class AppGradients {
  static final linear = LinearGradient(colors: [
    Color(0xFFF83062),
    Color.fromRGBO(254, 204, 102, 1)
  ], stops: [
    0.0,
    3.0
  ], transform: GradientRotation(pi/2)
  ) ;
}
