import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  cardColor: Colors.black,
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
);
