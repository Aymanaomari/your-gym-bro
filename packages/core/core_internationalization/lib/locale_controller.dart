import 'package:core_internationalization/internationalization_core.dart';
import 'package:flutter/widgets.dart';

class LocaleController extends ChangeNotifier {
  Locale _locale = InternationalizationCore.fallbackLocale;

  Locale get locale => _locale;

  void syncWithContext(Locale locale) {
    if (_locale == locale) {
      return;
    }

    _locale = locale;
    notifyListeners();
  }
}

Future<void> initializeInternationalization({
  required String translationsPath,
  Locale? startLocale,
}) {
  print(
    'Initializing internationalization with translations path: $translationsPath and start locale: $startLocale',
  );
  return InternationalizationCore.init(
    translationsPath: translationsPath,
    startLocale: startLocale,
  );
}

Widget localizationWrapper({required Widget child}) {
  return InternationalizationCore.wrapWithLocalization(child: child);
}
