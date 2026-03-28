import 'package:design_system/theme/ygb_v0_theme/ygb_v0_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class YGBV0AppOtpInput extends StatelessWidget {
  const YGBV0AppOtpInput({
    super.key,
    this.hasError = false,
    required this.onCompleted,
    required this.controller,
  });
  final bool hasError;
  final void Function(String)? onCompleted;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Pinput(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      forceErrorState: hasError,
      length: 5,

      errorText: hasError ? "" : null,
      errorBuilder: (errorText, pin) => const SizedBox.shrink(),
      defaultPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: theme.textTheme.titleSmall?.copyWith(
          color: hasError ? theme.ygbColors.error : theme.ygbColors.primary50,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: theme.ygbColors.primary50.withAlpha(100)),
          borderRadius: BorderRadius.circular(theme.ygbRadius.lg),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: theme.textTheme.titleSmall?.copyWith(
          color: theme.ygbColors.primary50,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: theme.ygbColors.primary500),
          borderRadius: BorderRadius.circular(theme.ygbRadius.lg),
        ),
      ),
      submittedPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: theme.textTheme.titleSmall?.copyWith(
          color: theme.ygbColors.primary50,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: theme.ygbColors.primary500),
          borderRadius: BorderRadius.circular(theme.ygbRadius.lg),
        ),
      ),
      errorPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: theme.textTheme.titleSmall?.copyWith(
          color: theme.ygbColors.primary50,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: theme.ygbColors.error),
          borderRadius: BorderRadius.circular(theme.ygbRadius.lg),
        ),
      ),

      onCompleted: (value) => onCompleted?.call(value),
    );
  }
}
