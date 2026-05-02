import 'package:flutter/material.dart';
import 'package:user_connection/domain/entities/onboarding_content.dart';
import 'package:user_connection/domain/usecases/is_onboarding_completed.dart';
import 'package:user_connection/domain/usecases/mark_onboarding_completed.dart';

class OnboardingViewModel {
  OnboardingViewModel({
    required this.isOnboardingCompletedUseCase,
    required this.markOnboardingAsCompletedUseCase,
    List<OnboardingContent>? onboardingBackgrounds,
  }) : onboardingBackgrounds = onboardingBackgrounds ?? _defaultBackgrounds();

  final IsOnboardingCompleted isOnboardingCompletedUseCase;
  final MarkOnboardingAsCompleted markOnboardingAsCompletedUseCase;

  final List<OnboardingContent> onboardingBackgrounds;

  /// STATE
  final ValueNotifier<int> currentPageIndex = ValueNotifier(0);
  final ValueNotifier<bool?> isCompleted = ValueNotifier(null);

  static List<OnboardingContent> _defaultBackgrounds() {
    return [
      OnboardingContent(
        titleKey: 'onboarding_Welcome_To_Your_Gym',
        descriptionKey: 'onboarding_tagline',
        imagePath: 'assets/images/onboarding/onboarding-bg-1.png',
        buttonKey: 'onboarding_next',
        highlightedTitleKey: 'onboarding_app_name_suffix',
      ),
      OnboardingContent(
        titleKey: 'onboarding_second_title',
        descriptionKey: 'onboarding_second_tagline',
        imagePath: 'assets/images/onboarding/onboarding-bg-2.png',
        buttonKey: 'onboarding_start_training',
        highlightedTitleKey: 'onboarding_second_highlight',
      ),
    ];
  }

  /// ACTIONS

  void setPage(int index) {
    currentPageIndex.value = index;
  }

  Future<void> loadOnboardingStatus() async {
    isCompleted.value = await isOnboardingCompletedUseCase();
  }

  Future<void> completeOnboarding() async {
    await markOnboardingAsCompletedUseCase();
    isCompleted.value = true;
  }

  void dispose() {
    currentPageIndex.dispose();
    isCompleted.dispose();
  }
}
