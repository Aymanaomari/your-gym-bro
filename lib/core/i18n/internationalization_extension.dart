import 'package:flutter/widgets.dart';
import 'package:your_gym_bro/core/i18n/internationalization_core.dart';

extension InternationalizationExtension on BuildContext {
  String tr(
    String key, {
    List<String>? args,
    Map<String, String>? namedArgs,
    String? gender,
  }) {
    return InternationalizationCore.translate(
      key,
      context: this,
      args: args,
      namedArgs: namedArgs,
      gender: gender,
    );
  }
}

extension InternationalizationStringExtension on String {
  String tr({
    BuildContext? context,
    List<String>? args,
    Map<String, String>? namedArgs,
    String? gender,
  }) {
    return InternationalizationCore.translate(
      this,
      context: context,
      args: args,
      namedArgs: namedArgs,
      gender: gender,
    );
  }
}

extension InternationalizationTextExtension on Text {
  Text tr({
    BuildContext? context,
    List<String>? args,
    Map<String, String>? namedArgs,
    String? gender,
  }) {
    if (data == null) {
      return this;
    }

    return Text(
      data!.tr(
        context: context,
        args: args,
        namedArgs: namedArgs,
        gender: gender,
      ),
      key: key,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaler: textScaler,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }
}
