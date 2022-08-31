import 'package:flutter/material.dart';

class WeatherAppTheme {
  static TextTheme lightTextTheme() => const TextTheme(
      bodyMedium: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black));
  static TextTheme darkTextTheme() => const TextTheme(
      bodyMedium: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white));

  static ThemeData lightTheme() => ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        backgroundColor: const Color(0xFFAFFAFD),
        textTheme: lightTextTheme(),
        cardColor: Colors.white,
      );
  static ThemeData darkTheme() => ThemeData(
      primarySwatch: Colors.blueGrey,
      primaryColor: Colors.blueGrey,
      backgroundColor: const Color(0xFF06021B),
      cardColor: const Color(0xFF353336),
      textTheme: darkTextTheme());
}
