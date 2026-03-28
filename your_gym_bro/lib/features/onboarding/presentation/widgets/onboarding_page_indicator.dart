import 'package:flutter/material.dart';
import 'package:ygb_sdk/ygb_sdk.dart';

class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: theme.ygbSpacing.xs / 2),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentPage == index
                ? theme.ygbColors.primary50
                : theme.ygbColors.primary50.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ),
    );
  }
}
