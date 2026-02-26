import 'package:flutter/material.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_theme.dart';

class OnboardingTextBlock extends StatelessWidget {
  const OnboardingTextBlock({
    super.key,
    required this.title,
    required this.highlightedTitle,
    required this.description,
  });

  final String title;
  final String highlightedTitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: title),
              TextSpan(
                text: highlightedTitle,
                style: theme.textTheme.displayLarge?.copyWith(
                  color: theme.ygbColors.primary500,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.start,
          style: theme.textTheme.displayLarge?.copyWith(
            color: theme.ygbColors.primary50,
          ),
        ),
        SizedBox(height: theme.ygbSpacing.sm),
        Text(
          description,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.ygbColors.primary50,
          ),
        ),
      ],
    );
  }
}
