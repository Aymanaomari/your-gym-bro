import 'package:flutter/material.dart';
import 'ygb_v0_color_theme.dart';
import 'ygb_v0_radius_theme.dart';
import 'ygb_v0_spacing_theme.dart';
import 'ygb_v0_text_theme.dart';

class YGBV0ThemeDark {
  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF101010),
      textTheme: YgbV0TextTheme().textTheme,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xFF4BABE5),
        selectionColor: Color(0x664BABE5),
        selectionHandleColor: Color(0xFF4BABE5),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF171717),
        foregroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
      ),
      extensions: <ThemeExtension<dynamic>>[
        const YGBV0ColorTheme(
          primary50: Color(0xFF8E8E8E),
          primary100: Color(0xFF7A7A7A),
          primary200: Color(0xFF676767),
          primary300: Color(0xFF545454),
          primary400: Color(0xFF414141),
          primary500: Color(0xFF2F2F2F),
          primary600: Color(0xFF262626),
          primary700: Color(0xFF1E1E1E),
          primary800: Color(0xFF171717),
          primary900: Color(0xFF101010),
          error: Color(0xFFCC3300),
        ),
        YGBV0SpacingTheme(),
        YgbV0RadiusTheme(),
      ],
    );
  }
}
