import 'package:flutter/material.dart';

import 'padding.dart';
import 'text_style.dart';

class DataTile {
  static Row one({required String? title, required String? value, double? wide}) => Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(alignment: Alignment.centerLeft, width: wide ?? 115, padding: EdgeInsets.symmetric(vertical: MyPadding.value / 2), child: Text(title.toString(), style: MyTextStyle.dataTileKey)),
        Container(alignment: Alignment.centerLeft, margin: MyPadding.primary / 2, child: Text(":", style: MyTextStyle.dataTileKey)),
        Padding(padding: EdgeInsets.symmetric(vertical: MyPadding.value / 2), child: Text(value.toString().replaceAll("\n", " "), style: MyTextStyle.dataTileValue))
      ]);

  static Row two({required List<String?> titles, required List<String?> values, double? wide}) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Expanded(child: one(title: titles[0], value: values[0], wide: wide)), SizedBox(width: MyPadding.value), Expanded(child: one(title: titles[1], value: values[1], wide: wide))]);

  static Row three({required List<String?> titles, required List<String?> values, double? wide}) => Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: one(title: titles[0].toString(), value: values[0].toString(), wide: wide)),
        SizedBox(width: MyPadding.value),
        Expanded(child: one(title: titles[1].toString(), value: values[1].toString(), wide: wide)),
        SizedBox(width: MyPadding.value),
        Expanded(child: one(title: titles[2].toString(), value: values[2].toString(), wide: wide))
      ]);

  static Row four({required List<String?> titles, required List<String?> values, double? wide}) => Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: one(title: titles[0].toString(), value: values[0].toString(), wide: wide)),
        SizedBox(width: MyPadding.value),
        Expanded(child: one(title: titles[1].toString(), value: values[1].toString(), wide: wide)),
        SizedBox(width: MyPadding.value),
        Expanded(child: one(title: titles[2].toString(), value: values[2].toString(), wide: wide)),
        SizedBox(width: MyPadding.value),
        Expanded(child: one(title: titles[3].toString(), value: values[3].toString(), wide: wide))
      ]);
}
