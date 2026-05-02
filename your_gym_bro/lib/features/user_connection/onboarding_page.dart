import 'package:flutter/material.dart';
import 'package:ygb_sdk/ygb_sdk.dart';

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
    return OnboardingFactory().onboardingPage();
  }
}
