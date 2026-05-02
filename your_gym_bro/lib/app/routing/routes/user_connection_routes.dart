import 'dart:ui';

import 'package:go_router/go_router.dart';
import 'package:your_gym_bro/app/routing/routing_animations.dart';
import 'package:your_gym_bro/features/user_connection/forgot_password_page.dart';
import 'package:your_gym_bro/features/user_connection/onboarding_page.dart';
import 'package:your_gym_bro/features/user_connection/otp_page.dart';
import 'package:your_gym_bro/features/user_connection/signin_page.dart';
import 'package:your_gym_bro/features/user_connection/signup_page.dart';
import 'package:your_gym_bro/features/user_connection/splash_page.dart';

final userConnectionRoute = [
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
  GoRoute(
    path: SigninPage.routePath,
    name: SigninPage.routeName,
    pageBuilder: (context, state) => RoutingAnimations.slidePage(
      state: state,
      child: const SigninPage(),
      beginOffset: const Offset(-1, 0),
    ),
  ),
  GoRoute(
    path: SignupPage.routePath,
    name: SignupPage.routeName,
    pageBuilder: (context, state) => RoutingAnimations.slidePage(
      state: state,
      child: const SignupPage(),
      beginOffset: const Offset(1, 0),
    ),
  ),
  GoRoute(
    path: ForgotPasswordPage.routePath,
    name: ForgotPasswordPage.routeName,
    pageBuilder: (context, state) => RoutingAnimations.slidePage(
      state: state,
      child: const ForgotPasswordPage(),
      beginOffset: const Offset(1, 0),
    ),
  ),
  GoRoute(
    path: OtpPage.routePath,
    name: OtpPage.routeName,
    builder: (context, state) =>
        OtpPage(userEmail: state.uri.queryParameters["email"]),
  ),
];
