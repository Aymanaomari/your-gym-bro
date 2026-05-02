import 'package:flutter/material.dart';

class YgbV0TextTheme {
  static const _baseFontSize = 14.0;

  TextTheme get textTheme => const TextTheme(
    displayLarge: TextStyle(
      fontFamily: "RushDriver",
      fontSize: _baseFontSize * 2.38,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontFamily: "RushDriver",
      fontSize: _baseFontSize * 2.2857, // 32 / 14
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontFamily: "RushDriver",
      fontSize: _baseFontSize * 1.2857, // 18 / 14
      color: Colors.white,
    ),
    headlineLarge: TextStyle(
      fontFamily: "Inter",
      fontSize: _baseFontSize * 2.9857, // 41.8 / 14
      height: 1.35,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontFamily: "Inter",
      fontSize: _baseFontSize * 2.4886, // 34.84 / 14
      height: 1.35,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontFamily: "Inter",
      fontSize: _baseFontSize * 2.0736, // 29.03 / 14
      height: 1.35,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontFamily: "Inter",
      fontSize: _baseFontSize * 1.7286, // 24.2 / 14
      height: 1.4,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontFamily: "Inter",
      fontSize: _baseFontSize * 1.4286, // 20 / 14
      height: 1.4,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontFamily: "Inter",
      fontSize: _baseFontSize * 1.1429, // 16 / 14
      height: 1.4,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Inter",
      fontSize: _baseFontSize * 1.0, // 14 / 14
      height: 1.45,
      color: Colors.white,
    ),
    labelLarge: TextStyle(
      fontFamily: "Inter",
      fontSize: _baseFontSize * 0.8336, // 11.67 / 14
      height: 1.5,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontFamily: "Inter",
      fontSize: _baseFontSize * 0.6943, // 9.72 / 14
      height: 1.5,
      color: Colors.white,
    ),
  );
}
