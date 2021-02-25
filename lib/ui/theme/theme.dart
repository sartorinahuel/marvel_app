import 'package:flutter/material.dart';

class AppTheme {
  //Marvel colors
  //Source: https://www.color-hex.com/color-palette/20730
  static Color marvelBlue = Color(0xFF0000ff);
  static Color marvelDarkBlue = Color(0xFF002d5c);
  static Color marvelRed = Color(0xFF870000);
  static Color marvelGrey = Color(0xFFa5a5ab);
  static Color marvelLightGrey = Color(0xFFf0f0f0);

  //TODO: dark theme and themeBloc to select color mode.

  final lightTheme = ThemeData(
    primaryColor: marvelBlue,
    backgroundColor: marvelDarkBlue,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      color: marvelRed,
      elevation: 5,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 20,
        fontFamily: 'Monserrat',
        color: marvelLightGrey,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 18,
        color: marvelLightGrey,
        fontFamily: 'Monserrat',
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        color: marvelLightGrey,
        fontFamily: 'Monserrat',
      ),
      bodyText2: TextStyle(
        fontSize: 12,
        color: marvelLightGrey,
        fontFamily: 'Monserrat',
      ),
      button: TextStyle(
        fontSize: 14,
        color: marvelLightGrey,
        fontFamily: 'Monserrat',
      ),
    ),
  );
}
