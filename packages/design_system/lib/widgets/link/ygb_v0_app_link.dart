import 'package:design_system/theme/ygb_v0_theme/ygb_v0_theme.dart';
import 'package:flutter/material.dart';

enum LinkStyleVariant { primary, secondary, danger }

class YgbV0AppLink extends StatelessWidget {
  const YgbV0AppLink({
    super.key,
    required this.type,
    required this.text,
    this.onPressed,
    this.isUnderlined = true,
  });

  final LinkStyleVariant type;
  final String text;
  final void Function()? onPressed;
  final bool isUnderlined;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final linkColor = switch (type) {
      LinkStyleVariant.primary => theme.ygbColors.primary400,
      LinkStyleVariant.secondary => theme.ygbColors.primary50,
      LinkStyleVariant.danger => theme.ygbColors.error,
    };

    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: linkColor,
          fontWeight: FontWeight.w500,
          decoration: isUnderlined
              ? TextDecoration.underline
              : TextDecoration.none,
          decorationColor: linkColor,
        ),
      ),
    );
  }
}
