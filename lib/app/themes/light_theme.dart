import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.white,

  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Colors.white,
    selectedColor: Color.fromARGB(255, 92, 203, 254),
    secondarySelectedColor: Colors.white,
    labelStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  cardColor: Colors.black,
  cardTheme: const CardTheme(
    color: Colors.black,
    elevation: 12,
    surfaceTintColor: Colors.black,
  ),
);
