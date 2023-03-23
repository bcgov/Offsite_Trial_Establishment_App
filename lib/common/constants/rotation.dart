import 'package:flutter/material.dart';

abstract class QuarterTurns {
  static const quarter = 1;
  static const half = 2;
  static const threeQuarters = 3;
  static const full = 4;
}

abstract class TurnTween {
  static final half = Tween<double>(begin: 0.0, end: 0.5);
  static final reverseHalf = Tween<double>(begin: 0.0, end: -0.5);
}
