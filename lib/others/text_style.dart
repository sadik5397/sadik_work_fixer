import 'package:flutter/material.dart';

import 'colors.dart';

class MyTextStyle {
  static TextStyle white = const TextStyle(color: Colors.white);
  static TextStyle black = const TextStyle(color: Colors.black87);
  static TextStyle textFieldTitle = TextStyle(color: MyColor.jetBlack.withOpacity(.8), fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle textFieldLabel = TextStyle(color: MyColor.jetBlack, fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle textFieldHint = TextStyle(color: MyColor.jetBlack.withOpacity(.5), fontSize: 14, fontWeight: FontWeight.normal);
  static TextStyle textFieldLabelFloating = TextStyle(height: 1.5, color: MyColor.primary, fontWeight: FontWeight.w700);
  static TextStyle title = TextStyle(height: 1.75, color: MyColor.title, fontWeight: FontWeight.w700, fontSize: 22);
  static TextStyle bigText = const TextStyle(fontWeight: FontWeight.bold, fontSize: 28);
  static TextStyle heading = TextStyle(color: MyColor.title, fontSize: 16);
  static TextStyle bold = const TextStyle(fontWeight: FontWeight.w700);
  static TextStyle subtitle = TextStyle(height: 1.75, color: MyColor.title.withOpacity(.5), fontWeight: FontWeight.normal, fontSize: 14);
  static TextStyle dataTileKey = const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14);
  static TextStyle dataTileValue = const TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14);
}
