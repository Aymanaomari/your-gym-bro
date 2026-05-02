import 'package:flutter/material.dart';
export 'ygb_v0_theme_dark.dart';
import 'ygb_v0_color_theme.dart';
import 'ygb_v0_radius_theme.dart';
import 'ygb_v0_spacing_theme.dart';
import 'ygb_v0_text_theme.dart';

class YGBV0ThemeLight {
  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF041320),
      textTheme: YgbV0TextTheme().textTheme,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xFF2493D7),
        selectionColor: Color(0x662493D7),
        selectionHandleColor: Color(0xFF2493D7),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF041320),
        foregroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
      ),
      extensions: <ThemeExtension<dynamic>>[
        YGBV0ColorTheme(
          primary50: const Color(0xFFF1F8FE),
          primary100: const Color(0xFFE3EFFB),
          primary200: const Color(0xFFC1E0F6),
          primary300: const Color(0xFF89C8F0),
          primary400: const Color(0xFF4BABE5),
          primary500: const Color(0xFF2493D7),
          primary600: const Color(0xFF125B92),
          primary700: const Color(0xFF125B92),
          primary800: const Color(0xFF125B92),
          primary900: const Color(0xFF164264),
          error: const Color(0xFFCC3300),
        ),
        YGBV0SpacingTheme(),
        YgbV0RadiusTheme(),
      ],
    );
  }
}

extension YGBV0ThemeExtension on ThemeData {
  YGBV0ColorTheme get ygbColors =>
      extension<YGBV0ColorTheme>() ?? YGBV0ColorTheme.dark;
}

extension YGBV0SpacingThemeExtension on ThemeData {
  YGBV0SpacingTheme get ygbSpacing =>
      extension<YGBV0SpacingTheme>() ?? YGBV0SpacingTheme();
}

extension YGBV0RadiusThemeExtension on ThemeData {
  YgbV0RadiusTheme get ygbRadius =>
      extension<YgbV0RadiusTheme>() ?? YgbV0RadiusTheme();
}
