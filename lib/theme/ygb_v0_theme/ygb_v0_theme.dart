import 'package:flutter/material.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_color_theme.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_spacing_theme.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_text_theme.dart';

class YGBV0ThemeLight {
  ThemeData get themeData {
    return ThemeData(
      textTheme: YgbV0TextTheme().textTheme,
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
        ),
        YGBV0SpacingTheme(),
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
