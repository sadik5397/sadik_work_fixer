import 'package:flutter/material.dart';

import 'border_radius.dart';
import 'colors.dart';
import 'padding.dart';

class MyButton {
  static Padding primary({EdgeInsets? margin, double? width, double? height, Color? color, required String label, bool isLoading = false, required void Function() onTap, bool expand = false, IconData? icon}) =>
      Padding(
          padding: margin ?? MyPadding.zero,
          child: ElevatedButton(
              onPressed: isLoading ? () {} : onTap,
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: expand ? Size.fromHeight(MyPadding.value * 3) : Size(width ?? (label.length).toDouble(), MyPadding.value * 3),
                  shape: RoundedRectangleBorder(borderRadius: MyBorderRadius.half),
                  textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  padding: EdgeInsets.symmetric(horizontal: MyPadding.value * 2, vertical: height != null ? height / 2 : MyPadding.value * 1.75),
                  backgroundColor: color ?? MyColor.primary,
                  foregroundColor: MyColor.white),
              child: isLoading
                  ? Center(child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: MyColor.white, strokeWidth: 2)))
                  : Row(mainAxisAlignment: MainAxisAlignment.center, children: [if (icon != null) Icon(icon, size: 20), if (icon != null) SizedBox(width: MyPadding.value / 1.5), Text(label)])));

  static Padding text({EdgeInsets? margin, double? width, double? height, required String label, bool isLoading = false, required void Function() onTap, bool expand = false, IconData? icon}) => Padding(
      padding: margin ?? MyPadding.zero,
      child: ElevatedButton(
          onPressed: isLoading ? () {} : onTap,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: MyColor.transparent,
              minimumSize: expand ? Size.fromHeight(MyPadding.value * 3) : Size(width ?? (label.length).toDouble(), MyPadding.value * 3),
              shape: RoundedRectangleBorder(borderRadius: MyBorderRadius.half),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              padding: EdgeInsets.symmetric(horizontal: MyPadding.value * 2, vertical: height != null ? height / 2 : MyPadding.value * 1.75),
              backgroundColor: MyColor.transparent,
              foregroundColor: MyColor.primary),
          child: isLoading
              ? Center(child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: MyColor.white, strokeWidth: 2)))
              : Row(mainAxisAlignment: MainAxisAlignment.center, children: [if (icon != null) Icon(icon, size: 20), if (icon != null) SizedBox(width: MyPadding.value / 1.5), Text(label)])));

  static Padding outline({EdgeInsets? margin, double? width, Color? color, double? height, required String label, bool isLoading = false, required void Function() onTap, bool expand = false, IconData? icon}) =>
      Padding(
          padding: margin ?? MyPadding.zero,
          child: ElevatedButton(
              onPressed: isLoading ? () {} : onTap,
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: expand ? Size.fromHeight(MyPadding.value * 3) : Size(width ?? (label.length).toDouble(), MyPadding.value * 3),
                  shape: RoundedRectangleBorder(borderRadius: MyBorderRadius.half, side: BorderSide(color: color ?? MyColor.primary, width: .5, strokeAlign: BorderSide.strokeAlignInside)),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
                  padding: EdgeInsets.symmetric(horizontal: MyPadding.value * 2, vertical: height != null ? height / 2 : MyPadding.value * 1.75),
                  backgroundColor: MyColor.white,
                  foregroundColor: color ?? MyColor.primary),
              child: isLoading
                  ? Center(child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: MyColor.white, strokeWidth: 2)))
                  : Row(mainAxisAlignment: MainAxisAlignment.center, children: [if (icon != null) Icon(icon, size: 20), if (icon != null) SizedBox(width: MyPadding.value / 1.5), Text(label)])));
}
