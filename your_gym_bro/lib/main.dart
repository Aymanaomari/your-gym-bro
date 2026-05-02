import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/routing/go_router.dart';
import 'package:ygb_sdk/ygb_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeInternationalization(translationsPath: "assets/i18n");

  runApp(localizationWrapper(child: const ProviderScope(child: MainApp())));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routers,
      theme: YGBV0ThemeLight().themeData,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}
