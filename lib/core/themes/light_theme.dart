import 'package:flutter/material.dart';
import 'package:todo_app/core/functions/custom_outline_input_border.dart';
import 'package:todo_app/core/themes/app_colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Montserrat',
  brightness: Brightness.light,
).copyWith(
  scaffoldBackgroundColor: Colors.white,
  //app bar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
  ),
  //floating action button theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.deepOrangePrimaryColor,
    elevation: 0.0,
    foregroundColor: Colors.white,
  ),
  // elevated button theme
  elevatedButtonTheme: ElevatedButtonThemeData( 
      style: ElevatedButton.styleFrom(
    elevation: 0.0,
    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    backgroundColor: AppColors.deepOrangePrimaryColor,
    foregroundColor: Colors.white,
  )),
  // inputDecorationTheme
  inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Colors.black45),
      enabledBorder: customOutlineInputBorder(borderColor: Colors.black45),
      focusedBorder: customOutlineInputBorder(borderColor: Colors.black45),
      errorBorder: customOutlineInputBorder(borderColor: Colors.red),
      focusedErrorBorder: customOutlineInputBorder(borderColor: Colors.red),
      suffixIconColor: Colors.black45),
);
