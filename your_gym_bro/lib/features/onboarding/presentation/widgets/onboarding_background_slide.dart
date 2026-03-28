import 'package:flutter/material.dart';
import 'package:your_gym_bro/features/onboarding/presentation/models/onboarding_screen_data.dart';

class OnboardingBackgroundSlide extends StatelessWidget {
  const OnboardingBackgroundSlide({super.key, required this.data});

  final OnboardingScreenData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(data.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
