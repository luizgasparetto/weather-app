import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: const Color.fromRGBO(43, 43, 96, 1),
      backgroundColor: const Color.fromRGBO(35, 38, 50, 1),
      fontFamily: 'PT Sans',
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 82,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(43, 43, 96, 1),
        ),
        headline3: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(43, 43, 96, 1),
        ),
        headline4: TextStyle(
          fontSize: 19,
          color: Color.fromRGBO(43, 43, 96, 1),
        ),
      ),
    );
  }
}
