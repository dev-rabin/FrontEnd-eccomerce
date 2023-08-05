// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppColors {
  static Color accent = Colors.blueAccent;
  static Color text = Colors.black;
  static Color textLight = Colors.grey;
  static Color white = Colors.white;
}

class Themes {
  static ThemeData defaultTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.text),
        titleTextStyle: TextStyle(
            fontSize: 18, color: AppColors.text, fontWeight: FontWeight.w500),
      ),
      colorScheme: ColorScheme.light(
          primary: AppColors.accent, secondary: AppColors.accent));
}
