import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTheme {
  static ThemeData getTheme(ColorScheme colorScheme) {
    return ThemeData(
        colorScheme: colorScheme,
      inputDecorationTheme: InputDecoration(
        labelStyle:  TextStyle(
          color: AppColors.gray,
          fontSize: 16.sp,
          fontWeight: FontWeightManager.medium
        ),
        hintStyle: TextStyle(
            color: AppColors.midGray,
            fontSize: 14.sp,
            fontWeight: FontWeightManager.medium
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4)
        )
      )
    );
  }

  static  ThemeData lightTheme() =>
      getTheme(const ColorScheme(brightness: Brightness.light,
          primary: AppColors.pink,
          onPrimary: AppColors.white,
          secondary: AppColors.black,
          onSecondary: AppColors.black,
          error: AppColors.red,
          onError: AppColors.red,
          surface:AppColors.white,
          onSurface: AppColors.black));

}