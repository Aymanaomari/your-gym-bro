import 'package:design_system/widgets/snack_bar/ygb_v0_snack_bar.dart';
import 'package:flutter/material.dart';

mixin SnackbarMixin {
  void _showSnackBar(
    BuildContext context, {
    required String message,
    required SnackBarType type,
    Duration duration = const Duration(seconds: 3),
  }) {
    final messenger = ScaffoldMessenger.of(context);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: YgbV0SnackBar(message: message, type: type),
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          duration: duration,
        ),
      );
  }

  void showSnackbar(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(context, message: message, type: type, duration: duration);
  }

  void showSuccessSnackbar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      context,
      message: message,
      type: SnackBarType.success,
      duration: duration,
    );
  }

  void showErrorSnackbar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    _showSnackBar(
      context,
      message: message,
      type: SnackBarType.error,
      duration: duration,
    );
  }

  void showInfoSnackbar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      context,
      message: message,
      type: SnackBarType.info,
      duration: duration,
    );
  }

  void showWarningSnackbar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      context,
      message: message,
      type: SnackBarType.warning,
      duration: duration,
    );
  }
}
