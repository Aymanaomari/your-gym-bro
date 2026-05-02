import 'package:design_system/theme/ygb_v0_theme/ygb_v0_theme.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.signInTagline,
    required this.signInPrefix,
    required this.signInHighlight,
  });

  final String signInTagline;
  final String signInPrefix;
  final String signInHighlight;
  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).ygbSpacing;

    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              text: signInPrefix,
              style: Theme.of(context).textTheme.displayMedium,
              children: [
                TextSpan(
                  text: signInHighlight,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).ygbColors.primary500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: spacing.sm),
          Text(
            signInTagline,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).ygbColors.neutral400,
            ),
          ),
        ],
      ),
    );
  }
}
