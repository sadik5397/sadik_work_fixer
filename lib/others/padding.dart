import 'package:flutter/material.dart';

class MyPadding {
  static double value = 12;
  static EdgeInsets primary = EdgeInsets.all(value);
  static EdgeInsets primaryAndQrt = EdgeInsets.all(value * 1.25);
  static EdgeInsets horz = EdgeInsets.symmetric(horizontal: value);
  static EdgeInsets vert = EdgeInsets.symmetric(vertical: value);
  static EdgeInsets top = EdgeInsets.only(top: value);
  static EdgeInsets bottom = EdgeInsets.only(bottom: value);
  static EdgeInsets left = EdgeInsets.only(left: value);
  static EdgeInsets right = EdgeInsets.only(right: value);
  static EdgeInsets half = EdgeInsets.all(value / 2);
  static EdgeInsets zero = EdgeInsets.zero;
}
