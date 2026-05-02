import 'package:flutter/material.dart';
import 'package:user_connection/presentation/pages/splash_page.dart';
import 'package:user_connection/presentation/pages/on_boarding_page.dart';

class OnboardingFactory {
  OnboardingFactory();

  Widget splashPage({ValueChanged<bool>? onCompleted}) {
    return SplashPage(onCompleted: onCompleted);
  }

  Widget onboardingPage({ValueChanged<bool>? onCompleted}) {
    return OnBoardingPage(onCompleted: onCompleted);
  }
}
