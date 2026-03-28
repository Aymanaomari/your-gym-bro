import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class InternationalizationCore {
  InternationalizationCore._();

  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
  ];

  static const Locale fallbackLocale = Locale('en', 'US');
  static const String translationsPath = 'assets/i18n';

  static Future<void> init() async {
    await EasyLocalization.ensureInitialized();
  }

  static Widget wrapWithLocalization({required Widget child}) {
    return EasyLocalization(
      supportedLocales: supportedLocales,
      path: translationsPath,
      fallbackLocale: fallbackLocale,
      child: child,
    );
  }

  static String translate(
    String key, {
    BuildContext? context,
    List<String>? args,
    Map<String, String>? namedArgs,
    String? gender,
  }) {
    return tr(
      key,
      context: context,
      args: args,
      namedArgs: namedArgs,
      gender: gender,
    );
  }
}
