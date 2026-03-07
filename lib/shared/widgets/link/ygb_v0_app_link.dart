import 'package:flutter/material.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_theme.dart';

enum ButtonStyleVariant { primary, secondary, danger }

class YgbV0AppLink extends StatelessWidget {
  const YgbV0AppLink({
    super.key,
    required this.type,
    required this.text,
    this.onPressed,
    this.isUnderlined = true,
  });

  final ButtonStyleVariant type;
  final String text;
  final void Function()? onPressed;
  final bool isUnderlined;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final linkColor = switch (type) {
      ButtonStyleVariant.primary => theme.ygbColors.primary500,
      ButtonStyleVariant.secondary => theme.ygbColors.primary50,
      ButtonStyleVariant.danger => theme.ygbColors.error,
    };

    Color resolveColor(Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return linkColor.withAlpha(100);
      }
      if (states.contains(WidgetState.pressed)) {
        return linkColor.withAlpha(180);
      }
      if (states.contains(WidgetState.hovered)) {
        return linkColor.withAlpha(200);
      }
      return linkColor;
    }

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: WidgetStateColor.resolveWith(
          (states) => linkColor.withAlpha(25),
        ),
        foregroundColor: WidgetStateColor.resolveWith(resolveColor),
        textStyle: WidgetStateTextStyle.resolveWith(
          (states) => TextStyle(
            decoration: isUnderlined
                ? TextDecoration.underline
                : TextDecoration.none,
            decorationColor: resolveColor(states),
          ),
        ),
      ),
      child: Text(text),
    );
  }
}
