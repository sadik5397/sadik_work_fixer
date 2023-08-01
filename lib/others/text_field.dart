import 'package:flutter/material.dart';

import 'border_radius.dart';
import 'colors.dart';
import 'padding.dart';
import 'text_style.dart';

class MyTextField {
  static Padding primary(
      {required String labelText,
      bool isPassword = false,
      EdgeInsetsGeometry? padding,
      bool isDate = false,
      bool isFile = false,
      bool hasSubmitButton = false,
      TextInputType keyboardType = TextInputType.text,
      String hintText = "Type Here",
      required TextEditingController controller,
      bool autoFocus = false,
      FocusNode? focusNode,
      String? errorText,
      bool required = false,
      String autofillHints = "",
      bool showPassword = false,
      TextCapitalization textCapitalization = TextCapitalization.sentences,
      VoidCallback? showPasswordPressed,
      VoidCallback? onFieldSubmittedAlternate,
      VoidCallback? onTap,
      Function(String value)? onChanged,
      Function(String value)? onFieldSubmitted,
      int maxLines = 1,
      bool showLabel = true,
      bool floatLabel = true,
      bool readOnly = false,
      bool centerAlign = false,
      bool isDisable = false}) {
    return Padding(
        padding: padding ?? MyPadding.bottom * 1.5,
        child: TextFormField(
            readOnly: (isDate || isFile || readOnly),
            showCursor: !(isDate || isFile || readOnly),
            onTap: onTap,
            onChanged: onChanged,
            maxLines: maxLines,
            autofillHints: [autofillHints],
            focusNode: focusNode,
            textAlign: centerAlign ? TextAlign.center : TextAlign.start,
            onFieldSubmitted: onFieldSubmitted,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            obscureText: (isPassword) ? !showPassword : false,
            controller: controller,
            style: MyTextStyle.textFieldLabel,
            autofocus: autoFocus,
            enabled: !isDisable,
            decoration: InputDecoration(

                ///borders
                focusedBorder: OutlineInputBorder(borderRadius: MyBorderRadius.half, borderSide: BorderSide(color: MyColor.primary.withOpacity(.5))),
                errorBorder: OutlineInputBorder(borderRadius: MyBorderRadius.half, borderSide: BorderSide(color: MyColor.danger)),
                focusedErrorBorder: OutlineInputBorder(borderRadius: MyBorderRadius.half, borderSide: BorderSide(color: MyColor.warning)),
                enabledBorder: OutlineInputBorder(borderRadius: MyBorderRadius.half, borderSide: BorderSide(color: MyColor.off)),
                disabledBorder: OutlineInputBorder(borderRadius: MyBorderRadius.half, borderSide: BorderSide(color: MyColor.off)),

                ///texts
                labelText: showLabel ? labelText : null,
                errorText: (errorText == "null" || errorText == null) ? null : errorText,
                // hintText: showLabel ? hintText : labelText,
                hintText: hintText,

                ///textStyles
                labelStyle: MyTextStyle.textFieldLabel,
                hintStyle: showLabel ? MyTextStyle.textFieldHint : MyTextStyle.textFieldHint.copyWith(fontSize: 14),
                floatingLabelStyle: MyTextStyle.textFieldLabelFloating,

                ///colors
                filled: true,
                fillColor: isDisable ? MyColor.black.withOpacity(.05) : MyColor.white,

                ///alignment
                alignLabelWithHint: true,
                floatingLabelAlignment: FloatingLabelAlignment.start,

                ///gaps
                contentPadding: MyPadding.primary * 1.5,
                isDense: true,

                ///behaviour
                floatingLabelBehavior: floatLabel ? FloatingLabelBehavior.auto : FloatingLabelBehavior.always,

                ///icons
                suffixIconColor: MyColor.jetBlack,
                suffixIcon: (isPassword)
                    ? IconButton(onPressed: showPasswordPressed, icon: Icon((!showPassword) ? Icons.visibility_outlined : Icons.visibility_off_outlined), iconSize: 18, color: MyColor.jetBlack.withOpacity(.5))
                    : (isDate)
                        ? IconButton(onPressed: onTap, icon: const Icon(Icons.calendar_month_sharp), iconSize: 18, color: MyColor.jetBlack.withOpacity(.5))
                        : (isFile)
                            ? IconButton(onPressed: onTap, icon: const Icon(Icons.attach_file_rounded), iconSize: 18, color: MyColor.jetBlack.withOpacity(.5))
                            : (hasSubmitButton)
                                ? IconButton(onPressed: onFieldSubmittedAlternate, icon: const Icon(Icons.arrow_downward_sharp), iconSize: 18, color: MyColor.jetBlack.withOpacity(.5))
                                : IconButton(onPressed: () => controller.clear(), icon: const Icon(Icons.cancel_outlined), iconSize: 18, color: MyColor.jetBlack.withOpacity(.5)))));
  }

  static Column main(
      {required String labelText,
      bool isPassword = false,
      EdgeInsetsGeometry? padding,
      bool isDate = false,
      bool isFile = false,
      bool hasSubmitButton = false,
      TextInputType keyboardType = TextInputType.text,
      String hintText = "Type Here",
      required TextEditingController controller,
      bool autoFocus = false,
      FocusNode? focusNode,
      String? errorText,
      bool required = false,
      String autofillHints = "",
      bool showPassword = false,
      TextCapitalization textCapitalization = TextCapitalization.sentences,
      VoidCallback? showPasswordPressed,
      VoidCallback? onFieldSubmittedAlternate,
      VoidCallback? onTap,
      Function(String value)? onChanged,
      Function(String value)? onFieldSubmitted,
      int maxLines = 1,
      bool floatLabel = true,
      bool readOnly = false,
      bool centerAlign = false,
      bool isDisable = false}) {
    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: MyPadding.bottom / 2, child: Text(labelText, style: MyTextStyle.textFieldTitle)),
      primary(
          controller: controller,
          labelText: labelText,
          floatLabel: floatLabel,
          showLabel: false,
          onTap: onTap,
          readOnly: readOnly,
          isDate: isDate,
          autoFocus: autoFocus,
          textCapitalization: textCapitalization,
          showPasswordPressed: showPasswordPressed,
          showPassword: showPassword,
          isPassword: isPassword,
          keyboardType: keyboardType,
          autofillHints: autofillHints,
          centerAlign: centerAlign,
          errorText: errorText,
          focusNode: focusNode,
          hasSubmitButton: hasSubmitButton,
          hintText: hintText,
          isDisable: isDisable,
          isFile: isFile,
          maxLines: maxLines,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          onFieldSubmittedAlternate: onFieldSubmittedAlternate,
          padding: padding,
          required: required)
    ]);
  }
}
