import 'dart:ui';

import 'package:flutter/material.dart';

class YgbV0RadiusTheme extends ThemeExtension<YgbV0RadiusTheme> {
  const YgbV0RadiusTheme({
    this.xs = 2,
    this.sm = 4,
    this.md = 8,
    this.lg = 12,
    this.xl = 16,
    this.xxl = 24,
    this.full = 999,
  });

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;
  final double full;

  @override
  YgbV0RadiusTheme copyWith({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
    double? full,
  }) {
    return YgbV0RadiusTheme(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
      full: full ?? this.full,
    );
  }

  @override
  YgbV0RadiusTheme lerp(covariant YgbV0RadiusTheme? other, double t) {
    if (other == null) return this;
    return YgbV0RadiusTheme(
      xs: lerpDouble(xs, other.xs, t) ?? xs,
      sm: lerpDouble(sm, other.sm, t) ?? sm,
      md: lerpDouble(md, other.md, t) ?? md,
      lg: lerpDouble(lg, other.lg, t) ?? lg,
      xl: lerpDouble(xl, other.xl, t) ?? xl,
      xxl: lerpDouble(xxl, other.xxl, t) ?? xxl,
      full: lerpDouble(full, other.full, t) ?? full,
    );
  }
}
