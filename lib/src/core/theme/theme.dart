import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  ),
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white).copyWith(
  //   brightness: Brightness.light,
  //   primary: Color(0xFFFDB3022),
  //   onPrimary: Colors.black,
  //   surface: Color(0xfffdb3022),
  //   onSurface: Colors.black,
  //   secondary: Colors.red,
  //   onSecondary: Colors.red,
  //   background: const Color(0xFFF4F4F4),
  //   onBackground: Colors.red,
  // ),
  appBarTheme: const AppBarTheme(
    //color: Color(0xFFF4F4F4),
    //color: Color(0xfffdb3022),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  // //textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),

  // //cardTheme: const CardTheme(color: Colors.white),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) => const Color(0xFFFDB3022),
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) => Colors.white,
      ),
      // minimumSize: MaterialStateProperty.resolveWith<Size?>(
      //   (Set<MaterialState> states) => Size(double.infinity, 48.h),
      // ),
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 34.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: 30.0,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    ),
    // bodyLarge: TextStyle(
    //   fontSize: 11.0.sp,
    //   color: Colors.black,
    // ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      //color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 11.0,
      //color: Colors.black,
    ),
    labelLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    //titleMedium: TextStyle(fontSize: 18, color: Colors.white),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0A0E21),
    brightness: Brightness.dark,
  ),
  // appBarTheme: const AppBarTheme(
  //   color: Colors.blue,
  //   iconTheme: IconThemeData(color: Colors.white),
  // ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 34.0,
      fontWeight: FontWeight.bold,
      //color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 30.0,
      //color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 16.0,
      //color: Colors.white,
    ),
    // bodyLarge: TextStyle(
    //   fontSize: 30.0.sp,
    //   color: Colors.black,
    // ),
    // bodyMedium: TextStyle(
    //   fontSize: 16.0.sp,
    //   //color: Colors.white,
    // ),
    bodySmall: TextStyle(
      fontSize: 14.0,
      //color: Colors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    //titleMedium: TextStyle(fontSize: 18, color: Colors.white),
  ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //     backgroundColor: MaterialStateProperty.resolveWith<Color?>(
  //       (Set<MaterialState> states) => Colors.white,
  //     ),
  //     foregroundColor: MaterialStateProperty.resolveWith<Color?>(
  //       (Set<MaterialState> states) => Colors.black,
  //     ),
  //     // minimumSize: MaterialStateProperty.resolveWith<Size?>(
  //     //   (Set<MaterialState> states) => Size(double.infinity, 48.h),
  //     // ),
  //   ),
  // ),
);

//Theme.of(context).colorScheme.primary,
