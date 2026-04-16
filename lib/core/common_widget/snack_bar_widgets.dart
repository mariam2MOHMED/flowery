import 'package:another_flushbar/flushbar.dart';
import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';
import 'package:flutter/material.dart';

abstract class SnackBarWidgets {
  static void showSuccessMessage({
Widget?title,
    required String message,
    int duration = 2,
    required BuildContext context,
  }) {
    Flushbar(
      titleText: title,
  margin: const EdgeInsets.all(4),
  boxShadows: const [
  BoxShadow(
       color: Colors.lightGreen,
      blurRadius: 3.0,
      blurStyle: BlurStyle.outer
    )
  ],
      messageText: Text(message,style: getBoldStyle(
          color: AppColors.white,fontSize: 16.0),),
      duration: Duration(seconds: duration),
  padding:const  EdgeInsets.all(6),
  icon:
  const Icon(Icons.info_outline_rounded, color: Colors.white,
      size: 28.0),
      backgroundColor: AppColors.green,

    ).show(context);
  }
  static void showErrorMessage({
    Widget?title,
    required String message,
    int duration = 2,
    required BuildContext context,
  }) {
    Flushbar(
      titleText: title,
    messageText: Text(message,style: getBoldStyle(
        color: AppColors.white,fontSize: 16.0),),
      margin: const EdgeInsets.all(4),
      boxShadows: const [
        BoxShadow(
            color: Colors.redAccent,
            blurRadius: 3.0,
            blurStyle: BlurStyle.outer
        )
      ],
      duration: Duration(seconds: duration),
      padding:const  EdgeInsets.all(6),
      icon:
      const Icon(Icons.info_outline_rounded, color: Colors.white,
          size: 28.0),
      backgroundColor: AppColors.red,

    ).show(context);
  }
  }