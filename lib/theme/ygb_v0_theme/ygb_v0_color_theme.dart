import 'package:flutter/material.dart';

@immutable
class YGBV0ColorTheme extends ThemeExtension<YGBV0ColorTheme> {
  const YGBV0ColorTheme({
    required this.primary50,
    required this.primary100,
    required this.primary200,
    required this.primary300,
    required this.primary400,
    required this.primary500,
    required this.primary600,
    required this.primary700,
    required this.primary800,
    required this.primary900,
  });

  final Color primary50;
  final Color primary100;
  final Color primary200;
  final Color primary300;
  final Color primary400;
  final Color primary500;
  final Color primary600;
  final Color primary700;
  final Color primary800;
  final Color primary900;

  static const YGBV0ColorTheme dark = YGBV0ColorTheme(
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
  );

  Map<int, Color> get primaryScale => <int, Color>{
    50: primary50,
    100: primary100,
    200: primary200,
    300: primary300,
    400: primary400,
    500: primary500,
    600: primary600,
    700: primary700,
    800: primary800,
    900: primary900,
  };

  @override
  YGBV0ColorTheme copyWith({
    Color? primary50,
    Color? primary100,
    Color? primary200,
    Color? primary300,
    Color? primary400,
    Color? primary500,
    Color? primary600,
    Color? primary700,
    Color? primary800,
    Color? primary900,
  }) {
    return YGBV0ColorTheme(
      primary50: primary50 ?? this.primary50,
      primary100: primary100 ?? this.primary100,
      primary200: primary200 ?? this.primary200,
      primary300: primary300 ?? this.primary300,
      primary400: primary400 ?? this.primary400,
      primary500: primary500 ?? this.primary500,
      primary600: primary600 ?? this.primary600,
      primary700: primary700 ?? this.primary700,
      primary800: primary800 ?? this.primary800,
      primary900: primary900 ?? this.primary900,
    );
  }

  @override
  YGBV0ColorTheme lerp(ThemeExtension<YGBV0ColorTheme>? other, double t) {
    if (other is! YGBV0ColorTheme) {
      return this;
    }

    return YGBV0ColorTheme(
      primary50: Color.lerp(primary50, other.primary50, t) ?? primary50,
      primary100: Color.lerp(primary100, other.primary100, t) ?? primary100,
      primary200: Color.lerp(primary200, other.primary200, t) ?? primary200,
      primary300: Color.lerp(primary300, other.primary300, t) ?? primary300,
      primary400: Color.lerp(primary400, other.primary400, t) ?? primary400,
      primary500: Color.lerp(primary500, other.primary500, t) ?? primary500,
      primary600: Color.lerp(primary600, other.primary600, t) ?? primary600,
      primary700: Color.lerp(primary700, other.primary700, t) ?? primary700,
      primary800: Color.lerp(primary800, other.primary800, t) ?? primary800,
      primary900: Color.lerp(primary900, other.primary900, t) ?? primary900,
    );
  }
}
