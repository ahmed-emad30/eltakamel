import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eltakamel/core/app_themes/colors/app_colors.dart';

sealed class AppToast {
  static void showToast({
    required String message,
    ToastGravity? gravity,
    Color? color,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: color ?? AppColors.mainColor,
      textColor: textColor,
    );
  }
}
