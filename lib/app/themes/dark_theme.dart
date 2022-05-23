import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.black,
    secondary: const Color(0xFFCE9F49),
    brightness: Brightness.dark,
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
  ),
  backgroundColor: Colors.black,
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.white,
        fontSize: 97,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5),
    headline2: TextStyle(
        fontSize: 61,
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5),
    headline3: TextStyle(
      fontSize: 48,
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    ),
    headline4: TextStyle(
        fontSize: 34,
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    headline5: TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    ),
    headline6: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15),
    subtitle1: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    subtitle2: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    bodyText1: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5),
    bodyText2: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    button: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25),
    caption: TextStyle(
        fontSize: 12,
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4),
    overline: TextStyle(
        fontSize: 10,
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5),
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Colors.black,
    selectedColor: Color.fromARGB(255, 193, 133, 30),
    secondarySelectedColor: Colors.white,
    labelStyle: TextStyle(
      color: Colors.white,
    ),
  ),
  cardColor: Colors.black,
  cardTheme: const CardTheme(
    color: Colors.black,
    elevation: 12,
    surfaceTintColor: Colors.black,
  ),
);
