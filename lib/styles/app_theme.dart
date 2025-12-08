import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData mainTheme = ThemeData(

    fontFamily: 'Dana',

    textTheme: TextTheme(

      // HeadLines
      headlineLarge: TextStyle(
        fontFamily: 'Plasma',
        fontSize: 50,
        fontWeight: .bold,
      ),

      // Labels
      labelLarge: TextStyle(
        fontFamily: 'Dana',
        fontSize: 24,
        fontWeight: .bold,
      ),

      // Bodies
      bodySmall: TextStyle(
        fontFamily: 'Dana',
        fontSize: 20,
        fontWeight: .w400
      )

    ),

  );

}