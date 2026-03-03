import 'package:flutter/material.dart';
import 'package:your_gym_bro/core/utils/double_extensions.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_theme.dart';

enum ButtonStyleVariant { primary, secondary }

class YgbV0AppButton extends StatelessWidget {
  const YgbV0AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.outlined = false,
    this.type = ButtonStyleVariant.primary,
  });

  final void Function()? onPressed;
  final String text;
  final ButtonStyleVariant type;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseElevation = outlined ? 0.0 : 2.0;
    final pressedElevation = outlined ? 0.0 : 4.0;

    return MaterialButton(
      onPressed: onPressed,
      elevation: baseElevation,
      focusElevation: baseElevation,
      hoverElevation: baseElevation,
      highlightElevation: pressedElevation,
      disabledElevation: 0,

      color: outlined
          ? Colors.transparent
          : switch (type) {
              ButtonStyleVariant.primary => theme.ygbColors.primary500,
              ButtonStyleVariant.secondary => theme.ygbColors.primary700,
            },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: outlined
            ? BorderSide(
                color: switch (type) {
                  ButtonStyleVariant.primary => theme.ygbColors.primary500,
                  ButtonStyleVariant.secondary => theme.ygbColors.primary700,
                },
              )
            : BorderSide.none,
      ),

      height: 44,

      minWidth: 100.vw(context),
      padding: EdgeInsets.symmetric(horizontal: theme.ygbSpacing.md),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: outlined
              ? switch (type) {
                  ButtonStyleVariant.primary => theme.ygbColors.primary500,
                  ButtonStyleVariant.secondary => theme.ygbColors.primary700,
                }
              : theme.ygbColors.primary50,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
