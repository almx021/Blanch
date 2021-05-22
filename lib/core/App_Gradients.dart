import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class AppGradients {
  static final linear = LinearGradient(
      colors: [Color(0xFFF83062), Color.fromRGBO(254, 204, 102, 1)],
      stops: [0.0, 3.0],
      transform: GradientRotation(pi / 2));

  static final cleber = LinearGradient(
      colors: [Color(0xFF241C1C), Color(0xFF808080)],
      stops: [0.0, 3.0],
      transform: GradientRotation(pi / 2));

  static final linearinverso = LinearGradient(colors: [
    Color.fromRGBO(254, 204, 102, 1),
    Color.fromRGBO(248, 48, 98, 1),
  ], stops: [
    0.0,
    3.0
  ], transform: GradientRotation(pi / 2));
}
