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
}) {
  print(
    'Initializing internationalization with translations path: $translationsPath',
  );
  return InternationalizationCore.init(translationsPath: translationsPath);
}

Widget localizationWrapper({required Widget child}) {
  return InternationalizationCore.wrapWithLocalization(child: child);
}
