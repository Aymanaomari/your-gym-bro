import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:your_gym_bro/core/i18n/locale_controller.dart';
import 'package:your_gym_bro/shared/providers/local_provider.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routing/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeInternationalization();

  runApp(localizationWrapper(child: const ProviderScope(child: MainApp())));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(localeControllerProvider.notifier).syncWithContext(context.locale);
    final currentLocale = ref.watch(localeControllerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routers,
      theme: YGBV0ThemeLight().themeData,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: currentLocale,
    );
  }
}
