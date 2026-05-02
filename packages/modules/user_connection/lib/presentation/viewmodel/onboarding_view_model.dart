import 'package:flutter/material.dart';
import 'package:user_connection/domain/entities/onboarding_content.dart';

class OnboardingViewModel extends InheritedWidget {
  OnboardingViewModel({
    super.key,
    required super.child,
    this.currentPageIndex = 0,
    List<OnboardingContent>? onboardingBackgrounds,
  }) : onboardingBackgrounds = onboardingBackgrounds ?? _defaultBackgrounds();

  static List<OnboardingContent> _defaultBackgrounds() {
    return [
      OnboardingContent(
        title: 'onboarding_title_1',
        description: 'onboarding_description_1',
        imagePath: 'assets/images/onboarding/onboarding-bg-1.png',
      ),
      OnboardingContent(
        title: 'onboarding_title_2',
        description: 'onboarding_description_2',
        imagePath: 'assets/images/onboarding/onboarding-bg-2.png',
      ),
    ];
  }

  final int currentPageIndex;
  final List<OnboardingContent> onboardingBackgrounds;

  /// Access the OnboardingViewModel from the widget tree
  static OnboardingViewModel of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<OnboardingViewModel>();
    assert(result != null, 'OnboardingViewModel not found in context');
    return result!;
  }

  /// Create an updated copy with new page index
  OnboardingViewModel copyWith({int? currentPageIndex}) {
    return OnboardingViewModel(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      onboardingBackgrounds: onboardingBackgrounds,
      child: child,
    );
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    if (oldWidget is! OnboardingViewModel) return false;
    return oldWidget.currentPageIndex != currentPageIndex ||
        oldWidget.onboardingBackgrounds != onboardingBackgrounds;
  }
}
