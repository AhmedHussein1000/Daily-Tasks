import 'package:flutter/material.dart';
import 'package:todo_app/core/functions/custom_outline_input_border.dart';
import 'package:todo_app/core/themes/app_colors.dart';

ThemeData darkTheme =
    ThemeData(fontFamily: 'Montserrat', brightness: Brightness.dark).copyWith(
        scaffoldBackgroundColor: AppColors.bgDark,
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
          foregroundColor: Colors.black,
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
          foregroundColor: Colors.black,
        )),
        // inputDecorationTheme
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.grey.shade300),
            enabledBorder:
                customOutlineInputBorder(borderColor: Colors.grey.shade300),
            focusedBorder:
                customOutlineInputBorder(borderColor: Colors.grey.shade300),
            errorBorder: customOutlineInputBorder(borderColor: Colors.red),
            focusedErrorBorder:
                customOutlineInputBorder(borderColor: Colors.red),
            suffixIconColor: Colors.grey.shade300));
