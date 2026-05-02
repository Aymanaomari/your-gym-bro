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
    required this.neutral50,
    required this.neutral100,
    required this.neutral200,
    required this.neutral300,
    required this.neutral400,
    required this.neutral500,
    required this.neutral600,
    required this.neutral700,
    required this.neutral800,
    required this.neutral900,
    required this.error,
    required this.warning,
    required this.success,
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
  final Color neutral50;
  final Color neutral100;
  final Color neutral200;
  final Color neutral300;
  final Color neutral400;
  final Color neutral500;
  final Color neutral600;
  final Color neutral700;
  final Color neutral800;
  final Color neutral900;
  final Color error;
  final Color success;
  final Color warning;

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
    neutral50: Color(0xFFF9FAFB),
    neutral100: Color(0xFFF2F4F7),
    neutral200: Color(0xFFE4E7EB),
    neutral300: Color(0xFFD0D5DD),
    neutral400: Color(0xFF98A2B3),
    neutral500: Color(0xFF667085),
    neutral600: Color(0xFF475467),
    neutral700: Color(0xFF344054),
    neutral800: Color(0xFF1D2939),
    neutral900: Color(0xFF10161E),
    error: Color(0xFFCC3300),
    warning: Color(0xFFFF9F43),
    success: Color(0xFF28C76F),
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

  Map<int, Color> get neutralScale => <int, Color>{
    50: neutral50,
    100: neutral100,
    200: neutral200,
    300: neutral300,
    400: neutral400,
    500: neutral500,
    600: neutral600,
    700: neutral700,
    800: neutral800,
    900: neutral900,
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
    Color? neutral50,
    Color? neutral100,
    Color? neutral200,
    Color? neutral300,
    Color? neutral400,
    Color? neutral500,
    Color? neutral600,
    Color? neutral700,
    Color? neutral800,
    Color? neutral900,
    Color? error,
    Color? warning,
    Color? success,
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
      neutral50: neutral50 ?? this.neutral50,
      neutral100: neutral100 ?? this.neutral100,
      neutral200: neutral200 ?? this.neutral200,
      neutral300: neutral300 ?? this.neutral300,
      neutral400: neutral400 ?? this.neutral400,
      neutral500: neutral500 ?? this.neutral500,
      neutral600: neutral600 ?? this.neutral600,
      neutral700: neutral700 ?? this.neutral700,
      neutral800: neutral800 ?? this.neutral800,
      neutral900: neutral900 ?? this.neutral900,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      success: success ?? this.success,
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
      neutral50: Color.lerp(neutral50, other.neutral50, t) ?? neutral50,
      neutral100: Color.lerp(neutral100, other.neutral100, t) ?? neutral100,
      neutral200: Color.lerp(neutral200, other.neutral200, t) ?? neutral200,
      neutral300: Color.lerp(neutral300, other.neutral300, t) ?? neutral300,
      neutral400: Color.lerp(neutral400, other.neutral400, t) ?? neutral400,
      neutral500: Color.lerp(neutral500, other.neutral500, t) ?? neutral500,
      neutral600: Color.lerp(neutral600, other.neutral600, t) ?? neutral600,
      neutral700: Color.lerp(neutral700, other.neutral700, t) ?? neutral700,
      neutral800: Color.lerp(neutral800, other.neutral800, t) ?? neutral800,
      neutral900: Color.lerp(neutral900, other.neutral900, t) ?? neutral900,
      error: Color.lerp(error, other.error, t) ?? error,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      success: Color.lerp(success, other.success, t) ?? success,
    );
  }
}
