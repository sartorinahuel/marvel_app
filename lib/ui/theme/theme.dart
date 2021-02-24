import 'package:flutter/material.dart';

class AppTheme {
  final lightTheme = ThemeData(
    primaryColor: Colors.blue,
    backgroundColor: Colors.black,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 18,
        fontFamily: 'Monserrat',
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontFamily: 'Monserrat',
      ),
      bodyText1: TextStyle(
        fontSize: 15,
        fontFamily: 'Monserrat',
      ),
      bodyText2: TextStyle(
        fontSize: 12,
        fontFamily: 'Monserrat',
      ),
    ),
  );
}
