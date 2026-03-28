import 'package:design_system/theme/ygb_v0_theme/ygb_v0_theme.dart';
import 'package:flutter/material.dart';

enum SnackBarType { info, warning, success, error }

class YgbV0SnackBar extends StatelessWidget {
  const YgbV0SnackBar({
    super.key,
    required this.message,
    this.type = SnackBarType.info,
  });

  final String message;
  final SnackBarType type;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).ygbColors;
    final color = switch (type) {
      SnackBarType.info => colors.primary700,
      SnackBarType.warning => Color(0xFFF57C00),
      SnackBarType.success => Color(0xFF2E7D32),
      SnackBarType.error => colors.error,
    };

    final messagePrefix = switch (type) {
      SnackBarType.info => 'Info: ',
      SnackBarType.warning => 'Warning: ',
      SnackBarType.success => 'Success: ',
      SnackBarType.error => 'Error: ',
    };

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Card(
        color: switch (type) {
          SnackBarType.info => colors.primary200,
          SnackBarType.warning => Color(0xFFF8F3D6),
          SnackBarType.success => Color(0xFFDEF2D6),
          SnackBarType.error => Color(0xFFEBC8C4),
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Theme.of(context).ygbSpacing.sm),
          side: BorderSide(color: color, width: 1),
        ),

        child: Padding(
          padding: EdgeInsets.all(Theme.of(context).ygbSpacing.lg),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(switch (type) {
                SnackBarType.info => Icons.info_outline,
                SnackBarType.warning => Icons.warning_amber_outlined,
                SnackBarType.success => Icons.check_circle_outline,
                SnackBarType.error => Icons.error_outline,
              }, color: color),
              SizedBox(width: Theme.of(context).ygbSpacing.lg),
              Expanded(
                child: Text(
                  messagePrefix + message,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: color),
                ),
              ),
              SizedBox(width: Theme.of(context).ygbSpacing.lg),
              GestureDetector(
                onTap: () =>
                    ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                child: Icon(Icons.close, color: color, size: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
