// create a theme for the entire application
import 'package:flutter/material.dart';

class AppTheme{
  static const Color primaryColor = Colors.purpleAccent;
  static const Color textColor = Colors.black;
  static const Color buttonBgColor = Colors.purple;
  static Color? appBarColor = Colors.deepPurpleAccent[300];
  static Color? bgColor = Colors.deepPurple[600];

  static ThemeData appTheme= ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppTheme.appBarColor,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,

      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

}