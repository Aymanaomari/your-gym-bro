import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewmodel with BaseViewModel {
  ForgotPasswordViewmodel() {
    _init();
  }

  ///Text Editing Controllers
  late TextEditingController emailTextEditingController;

  void _init() {
    emailTextEditingController = TextEditingController();
  }

  Future<void> resetPassword() async {
    clearError();
    setLoading(true);

    final email = emailTextEditingController.text.trim();

    // TODO(ygb): Use a dedicated validators helper class once it is implemented.
    final isEmailValid = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);

    if (!isEmailValid) {
      setError('Please enter a valid email address.');
      setLoading(false);
      return;
    }

    //TODO: Implement the Logic of sending the email to the user
    await Future.delayed(const Duration(seconds: 1));

    setLoading(false);
  }

  void dispose() {
    emailTextEditingController.dispose();
    disposeBase();
  }
}
