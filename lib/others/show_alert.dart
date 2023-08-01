import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'border_radius.dart';
import 'colors.dart';
import 'package:quickalert/quickalert.dart';

class Show {
  static Future error({String action = "OKAY", String? label, String? title, int? seconds, VoidCallback? onConfirmBtnTap}) => QuickAlert.show(
      context: Get.context!,
      width: 400,
      onConfirmBtnTap: onConfirmBtnTap,
      type: QuickAlertType.error,
      borderRadius: MyBorderRadius.value,
      animType: QuickAlertAnimType.slideInUp,
      title: title ?? 'ERROR',
      text: label ?? "Something Went Wrong!",
      confirmBtnText: action,
      backgroundColor: MyColor.white,
      titleColor: MyColor.primary,
      textColor: MyColor.title,
      autoCloseDuration: seconds != null ? Duration(seconds: seconds) : null);

  static Future success({String action = "OKAY", String? label, String? title, int? seconds, VoidCallback? onTap, String? cancelBtnText, VoidCallback? onNoTap}) => QuickAlert.show(
      context: Get.context!,
      onConfirmBtnTap: onTap,
      width: 400,
      type: QuickAlertType.success,
      borderRadius: MyBorderRadius.value,
      animType: QuickAlertAnimType.slideInUp,
      title: title ?? 'SUCCESS',
      text: label ?? "Progress Complete",
      onCancelBtnTap: onNoTap,
      cancelBtnText: cancelBtnText ?? "Cancel",
      showCancelBtn: cancelBtnText != null,
      confirmBtnText: action,
      backgroundColor: MyColor.white,
      titleColor: MyColor.primary,
      textColor: MyColor.title,
      autoCloseDuration: seconds != null ? Duration(seconds: seconds) : null);

  static Future prompt({String action = "YES", String cancel = "NO", String? label, String? title, int? seconds, VoidCallback? onTap, VoidCallback? onNoTap}) => QuickAlert.show(
      context: Get.context!,
      onConfirmBtnTap: onTap,
      onCancelBtnTap: onNoTap ?? () => Get.back(),
      width: 400,
      type: QuickAlertType.warning,
      borderRadius: MyBorderRadius.value,
      animType: QuickAlertAnimType.slideInUp,
      title: title ?? 'Are You Sure?',
      text: label ?? "Click Yes/No",
      confirmBtnText: action,
      showCancelBtn: true,
      cancelBtnText: cancel,
      backgroundColor: MyColor.white,
      titleColor: MyColor.primary,
      textColor: MyColor.title,
      autoCloseDuration: seconds != null ? Duration(seconds: seconds) : null);

  static Future info({String action = "YES", String cancel = "NO", String? label, String? title, int? seconds, VoidCallback? onTap, bool showCancel = true}) => QuickAlert.show(
      context: Get.context!,
      onConfirmBtnTap: onTap,
      onCancelBtnTap: () => Get.back(),
      width: 400,
      type: QuickAlertType.info,
      borderRadius: MyBorderRadius.value,
      animType: QuickAlertAnimType.slideInUp,
      title: title ?? 'Attention!',
      text: label ?? "Click Yes/No",
      confirmBtnText: action,
      showCancelBtn: showCancel,
      cancelBtnText: cancel,
      backgroundColor: MyColor.white,
      titleColor: MyColor.primary,
      textColor: MyColor.title,
      autoCloseDuration: seconds != null ? Duration(seconds: seconds) : null);
}
