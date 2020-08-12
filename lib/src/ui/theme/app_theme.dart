import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static get darkTheme => ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xffE9446A),
      accentColor: Colors.white,
      cursorColor: Colors.white,
      scaffoldBackgroundColor: const Color(0xff0F0F0F),
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        elevation: 1.2,
        color: Colors.black54,
      ));
  static get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xffE9446A),
        accentColor: Colors.black,
        cursorColor: Colors.black45,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: Colors.white,
          elevation: 1.2,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
