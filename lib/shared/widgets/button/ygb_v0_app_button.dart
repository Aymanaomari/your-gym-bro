import 'package:flutter/material.dart';
import 'package:your_gym_bro/core/utils/double_extensions.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_theme.dart';

class YgbV0AppButton extends StatelessWidget {
  const YgbV0AppButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialButton(
      onPressed: onPressed,
      color: theme.ygbColors.primary500,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      height: 44,
      minWidth: 100.vw(context),
      padding: EdgeInsets.symmetric(horizontal: theme.ygbSpacing.md),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.ygbColors.primary50,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
