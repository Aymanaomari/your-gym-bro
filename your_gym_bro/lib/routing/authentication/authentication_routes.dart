import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_gym_bro/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:your_gym_bro/features/auth/presentation/pages/new_password_page.dart';
import 'package:your_gym_bro/features/auth/presentation/pages/otp_page.dart';
import 'package:your_gym_bro/features/auth/presentation/pages/password_reset_page.dart';
import 'package:your_gym_bro/features/auth/presentation/pages/singin_page.dart';
import 'package:your_gym_bro/features/auth/presentation/pages/singup_page.dart';
import 'package:your_gym_bro/features/auth/presentation/pages/successful_reset_page.dart';

final authenticationRoutes = [
  GoRoute(
    path: SinginPage.routePath,
    name: SinginPage.routeName,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const SinginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    ),
  ),
  GoRoute(
    path: SingupPage.routePath,
    name: SingupPage.routeName,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const SingupPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    ),
  ),
  GoRoute(
    path: ForgotPasswordPage.routePath,
    name: ForgotPasswordPage.routeName,
    builder: (context, state) => const ForgotPasswordPage(),
  ),
  GoRoute(
    path: OtpPage.routePath,
    name: OtpPage.routeName,
    builder: (context, state) {
      //TODO: Change this to use query parameters instead of hardcoding the email
      // final email = state.uri.queryParameters['email'] ?? '';
      final email = "aymanaomari@gmail.com";
      return OtpPage(email: email);
    },
  ),
  GoRoute(
    path: PasswordResetPage.routePath,
    name: PasswordResetPage.routeName,
    builder: (context, state) => PasswordResetPage(),
  ),
  GoRoute(
    path: NewPasswordPage.routePath,
    name: NewPasswordPage.routeName,
    builder: (context, state) => NewPasswordPage(),
  ),
  GoRoute(
    path: SuccessfulResetPage.routePath,
    name: SuccessfulResetPage.routeName,
    builder: (context, state) => const SuccessfulResetPage(),
  ),
];
