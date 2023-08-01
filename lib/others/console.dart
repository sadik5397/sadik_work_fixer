// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void PRINT(dynamic string, {String? title}) {
  if (kDebugMode) debugPrint("============= ${title ?? 'Console'} =============\n${string.toString()}");
}

Widget? PRINTJson(dynamic map) {
  print(map);
  print(map.runtimeType);
  if (map.toString() == "{}" || map.toString() == "" || map.toString() == "null" || map.toString() == "[]") return null;
  var encoder = const JsonEncoder.withIndent("     ");
  String pretty = encoder.convert(map);
  return SelectableText(pretty);
}
