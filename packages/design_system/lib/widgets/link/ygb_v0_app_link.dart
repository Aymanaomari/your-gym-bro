import 'package:design_system/theme/ygb_v0_theme/ygb_v0_theme.dart';
import 'package:flutter/material.dart';

enum LinkStyleVariant { primary, secondary, danger }

class YGBV0AppLink extends StatelessWidget {
  const YGBV0AppLink({
    super.key,
    required this.type,
    required this.text,
    this.onPressed,
    this.isUnderlined = true,
    this.fontSize,
  });

  final LinkStyleVariant type;
  final String text;
  final void Function()? onPressed;
  final bool isUnderlined;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final linkColor = switch (type) {
      LinkStyleVariant.primary => theme.ygbColors.primary400,
      LinkStyleVariant.secondary => theme.ygbColors.primary50,
      LinkStyleVariant.danger => theme.ygbColors.error,
    };

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
          child: Align(
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize ?? 14,
                color: linkColor,
                fontWeight: FontWeight.w500,
                decoration: isUnderlined
                    ? TextDecoration.underline
                    : TextDecoration.none,
                decorationColor: linkColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
