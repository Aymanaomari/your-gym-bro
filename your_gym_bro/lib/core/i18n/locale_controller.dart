import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_gym_bro/core/i18n/internationalization_core.dart';

class LocaleController extends Notifier<Locale> {
  @override
  Locale build() {
    return InternationalizationCore.fallbackLocale;
  }

  void syncWithContext(Locale locale) {
    if (state == locale) {
      return;
    }

    state = locale;
  }

  Future<void> changeLocale(BuildContext context, Locale locale) async {
    if (state == locale) {
      return;
    }

    await context.setLocale(locale);
    state = locale;
  }
}

Future<void> initializeInternationalization() {
  return InternationalizationCore.init();
}

Widget localizationWrapper({required Widget child}) {
  return InternationalizationCore.wrapWithLocalization(child: child);
}
