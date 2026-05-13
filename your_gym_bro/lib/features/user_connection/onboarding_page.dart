import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ygb_sdk/ygb_sdk.dart';
import 'package:your_gym_bro/features/user_connection/signin_page.dart';

class OnboardingPage extends StatefulWidget {
  static const String routePath = '/onboarding';
  static const String routeName = 'onboarding';
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingFactory().onboardingPage(
        onCompleted: (_) {
          context.goNamed(SigninPage.routeName);
        },
      ),
    );
  }
}
