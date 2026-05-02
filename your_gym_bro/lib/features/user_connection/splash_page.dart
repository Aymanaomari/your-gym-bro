import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ygb_sdk/ygb_sdk.dart';
import 'package:your_gym_bro/features/user_connection/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const String routePath = '/';
  static const String routeName = 'splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingFactory().splashPage(
        onCompleted: () {
          context.goNamed(OnboardingPage.routeName);
        },
      ),
    );
  }
}
