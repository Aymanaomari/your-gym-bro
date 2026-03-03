import 'package:your_gym_bro/core/constants/assets.dart';

class OnboardingScreenData {
  const OnboardingScreenData({
    required this.backgroundImage,
    required this.titleKey,
    required this.highlightedTitleKey,
    required this.descriptionKey,
    required this.buttonTextKey,
  });

  final String backgroundImage;
  final String titleKey;
  final String highlightedTitleKey;
  final String descriptionKey;
  final String buttonTextKey;
}

const List<OnboardingScreenData> onboardingScreens = [
  OnboardingScreenData(
    backgroundImage: Assets.onBoardingImage1,
    titleKey: 'onboarding_Welcome_To_Your_Gym',
    highlightedTitleKey: 'onboarding_app_name_suffix',
    descriptionKey: 'onboarding_tagline',
    buttonTextKey: 'onboarding_next',
  ),
  OnboardingScreenData(
    backgroundImage: Assets.onBoardingImage2,
    titleKey: 'onboarding_second_title',
    highlightedTitleKey: 'onboarding_second_highlight',
    descriptionKey: 'onboarding_second_tagline',
    buttonTextKey: 'onboarding_start_training',
  ),
];
