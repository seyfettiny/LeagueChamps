import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.white,
    secondary: const Color(0xFF936611),
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
  ),
  backgroundColor: Colors.white,
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black,
        fontSize: 97,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5),
    headline2: TextStyle(
        fontSize: 61,
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5),
    headline3: TextStyle(
      fontSize: 48,
      color: Colors.black,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    ),
    headline4: TextStyle(
        fontSize: 34,
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    headline5: TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    ),
    headline6: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15),
    subtitle1: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    subtitle2: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    bodyText1: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5),
    bodyText2: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    button: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25),
    caption: TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4),
    overline: TextStyle(
        fontSize: 10,
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5),
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Colors.white,
    selectedColor: Color.fromARGB(255, 92, 203, 254),
    secondarySelectedColor: Colors.white,
    labelStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  cardColor: Colors.white,
  cardTheme: const CardTheme(
    color: Colors.black,
    elevation: 12,
    surfaceTintColor: Colors.white,
  ),
);
