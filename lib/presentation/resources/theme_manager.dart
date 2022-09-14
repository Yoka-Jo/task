import 'package:flutter/material.dart';
import 'package:task/presentation/resources/colors_manager.dart';
import 'package:task/presentation/resources/text_style_managet.dart';

ThemeData getAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: elevatedButtonThemeData(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
  );
}

ElevatedButtonThemeData elevatedButtonThemeData() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        fixedSize: const Size(double.infinity, 64),
        primary: AppColors.green,
        onPrimary: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );

TextTheme textTheme() => TextTheme(
      titleLarge: getSemiBoldStyle(color: AppColors.green, fontSize: 24),
      titleMedium: getMediumStyle(color: AppColors.green, fontSize: 24),
      titleSmall: getLightStyle(color: AppColors.green),
      headlineLarge: getBoldStyle(
        color: AppColors.green,
        fontSize: 24,
      ),
      headlineMedium: getBoldStyle(color: AppColors.green, fontSize: 16),
    );

InputDecorationTheme inputDecorationTheme() => InputDecorationTheme(
      hintStyle: getLightStyle(color: AppColors.grey, fontSize: 16),
      contentPadding:
          const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 10),
      fillColor: AppColors.white,
      filled: true,
      errorStyle: getRegularStyle(color: AppColors.red),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(width: 1.0, color: AppColors.red),
      ),
    );
