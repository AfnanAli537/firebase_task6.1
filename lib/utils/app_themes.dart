import 'package:firebase_first_project/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    colorScheme:
        ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 81, 59, 119)),
    appBarTheme: AppBarTheme(
      color: AppColors.appbarLightColor,
      elevation: 10,
      centerTitle: true,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
      shadowColor: Color.fromARGB(255, 41, 26, 66),
    ),

    textTheme: TextTheme(bodySmall: TextStyle(color: AppColors.whiteApp)),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.whiteApp,
        //  alignment: Alignment.bottomCenter,
        textStyle: TextStyle(color: const Color.fromARGB(255, 20, 35, 61)),
      ),
    ),

    brightness: Brightness.light,
    // scaffoldBackgroundColor: AppColors.whiteBloc,
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme:
        ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 39, 31, 53)),
    appBarTheme: AppBarTheme(
      color: AppColors.appbarDarkColor,
      elevation: 20,
      centerTitle: true,
      shadowColor: Color.fromARGB(255, 11, 2, 27),
    ),

    textTheme: TextTheme(bodySmall: TextStyle(color: AppColors.whiteApp)),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.whiteApp,
        //  alignment: Alignment.bottomCenter,
        textStyle: TextStyle(color: const Color.fromARGB(255, 42, 48, 58)),
      ),
    ),

    brightness: Brightness.dark,
    // scaffoldBackgroundColor: AppColors.whiteBloc,
    useMaterial3: true,
  );
}
