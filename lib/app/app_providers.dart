import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_gym_bro/core/i18n/locale_controller.dart';
import 'package:your_gym_bro/core/storage/storage.dart';

final localeControllerProvider = NotifierProvider<LocaleController, Locale>(
  LocaleController.new,
);

final storageProvider = FutureProvider<Storage>((ref) async {
  final storage = await Storage.getInstance();
  return storage;
});
