import 'package:go_router/go_router.dart';
import 'package:your_gym_bro/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:your_gym_bro/features/onboarding/presentation/pages/splash_page.dart';
import 'package:your_gym_bro/routing/authentication/authentication_routes.dart';

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
    ...authenticationRoutes,
    // GoRoute(path: path),
  ],
);
