import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';

class ResetPasswordViewmodel with BaseViewModel {
  ResetPasswordViewmodel() {
    _init();
  }

  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  void _init() {
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  void resetPassword() {
    clearError();
    setLoading(true);

    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      setError('Please fill in all fields.');
      setLoading(false);
      return;
    }

    if (newPassword != confirmPassword) {
      setError('Passwords do not match.');
      setLoading(false);
      return;
    }

    //TODO: Implement the Logic of resetting the password

    setLoading(false);
  }

  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.disposeBase();
  }
}
