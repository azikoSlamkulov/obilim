import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  //brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  ),

  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
  ),

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
      textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
        (Set<MaterialState> states) => TextStyle(
          fontSize: 18.h,
          fontWeight: FontWeight.bold,
        ),
      ),
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
  //brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0A0E21),
    brightness: Brightness.dark,
  ),
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
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      // backgroundColor: MaterialStateProperty.resolveWith<Color?>(
      //   (Set<MaterialState> states) => Colors.white,
      // ),
      // foregroundColor: MaterialStateProperty.resolveWith<Color?>(
      //   (Set<MaterialState> states) => Colors.black,
      // ),
      // minimumSize: MaterialStateProperty.resolveWith<Size?>(
      //   (Set<MaterialState> states) => Size(double.infinity, 48.h),
      // ),
      textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
        (Set<MaterialState> states) => TextStyle(
          fontSize: 18.h,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
);

//Theme.of(context).colorScheme.primary,
