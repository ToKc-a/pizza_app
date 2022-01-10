import 'package:flutter/material.dart';

ThemeData globalTheme1() => ThemeData(
      fontFamily: 'Inter',
      splashColor: Colors.lightBlueAccent,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue,
      ).copyWith(
        secondary: Color.fromRGBO(236, 239, 241, 1),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.black,
          fontSize: 36,
          fontWeight: FontWeight.w600,
        ),
        headline2: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        headline3: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        headline4: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

ThemeData globalTheme2() => ThemeData(
  fontFamily: 'Georgia',
  splashColor: Colors.redAccent,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.red,
  ).copyWith(
    secondary: Colors.green,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 36,
      fontWeight: FontWeight.w600,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    headline3: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    headline4: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
);