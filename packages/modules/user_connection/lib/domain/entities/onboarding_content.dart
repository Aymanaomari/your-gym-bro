class OnboardingContent {
  final String titleKey;
  final String descriptionKey;
  final String imagePath;
  final String buttonKey;
  final String? highlightedTitleKey;

  OnboardingContent({
    required this.titleKey,
    required this.descriptionKey,
    required this.imagePath,
    required this.buttonKey,
    this.highlightedTitleKey,
  });
}
