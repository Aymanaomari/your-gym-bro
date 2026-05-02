import 'package:flutter/material.dart';
import 'package:user_connection/presentation/viewmodel/base_view_model.dart';

class SigninViewModel with BaseViewModel {
  SigninViewModel() {
    _init();
  }

  late TextEditingController emailController;
  late TextEditingController passwordController;

  final Map<String, String> userData = {};

  void _init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void reset({bool clearUserData = false}) {
    resetState();

    if (clearUserData) {
      userData.clear();
    }
  }

  void _setError(String message) {
    setError(message);
  }

  void signin() {
    reset(clearUserData: true);
    isLoading.value = true;

    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _setError("Email and password cannot be empty.");
      return;
    }

    if (email == "aymanaomaripro@gmail.com" && password == "123456") {
      userData["email"] = email;
      userData["name"] = "Aymana Omari";
      setLoading(false);
    } else {
      _setError("Invalid email or password.");
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    disposeBase();
  }
}
