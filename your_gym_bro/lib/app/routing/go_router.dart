import 'package:go_router/go_router.dart';
import 'package:your_gym_bro/features/user_connection/onboarding_page.dart';
import 'package:your_gym_bro/features/user_connection/splash_page.dart';

var routers = GoRouter(
  routes: [
    GoRoute(
      path: SplashPage.routePath,
      name: SplashPage.routeName,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: OnboardingPage.routePath,
      name: OnboardingPage.routeName,
      builder: (context, state) => const OnboardingPage(),
    ),
  ],
);
