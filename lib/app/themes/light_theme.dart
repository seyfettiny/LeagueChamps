import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  chipTheme: const ChipThemeData(
    backgroundColor: Colors.white,
    selectedColor: Color.fromARGB(255, 92, 203, 254),
    secondarySelectedColor: Colors.white,
    labelStyle: TextStyle(
      color: Colors.black,
    ),
  ),
);
