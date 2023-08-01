import 'package:flutter/material.dart';

import 'button.dart';
import 'padding.dart';
import 'static_value.dart';
import 'text_style.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.title, this.subtitle, this.onCreateNew, this.onRefresh});

  final String title;
  final String? subtitle;
  final void Function()? onCreateNew;
  final void Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: MyPadding.primaryAndQrt,
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: MyTextStyle.title), Text(subtitle ?? appName, style: MyTextStyle.subtitle)])),
          if (onRefresh != null) MyButton.outline(label: "Refresh", onTap: onRefresh ?? () {}, icon: Icons.refresh_rounded, margin: MyPadding.right),
          if (onCreateNew != null) MyButton.primary(label: "Add New", onTap: onCreateNew ?? () {}, icon: Icons.add)
        ]));
  }
}
