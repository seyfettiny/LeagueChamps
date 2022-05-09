import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  toggleableActiveColor: Colors.blue[800],
  cardColor: Colors.black,
  chipTheme: const ChipThemeData(
    backgroundColor: Colors.black,
    selectedColor: Color.fromARGB(255, 193, 133, 30),
    secondarySelectedColor: Colors.white,
    labelStyle: TextStyle(
      color: Colors.white,
    ),
  ),
);
