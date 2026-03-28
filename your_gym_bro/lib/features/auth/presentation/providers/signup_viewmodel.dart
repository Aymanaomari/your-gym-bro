import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

class SingupState {
  final String email;
  final String password;
  final String confirmPassword;
  final bool isLoading;
  final String? errorMessage;

  SingupState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isLoading = false,
    this.errorMessage,
  });

  SingupState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    bool? isLoading,
    String? errorMessage,
  }) {
    return SingupState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class SignupViewModel extends StateNotifier<SingupState> {
  SignupViewModel() : super(SingupState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  void onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }

  Future<void> signup() async {
    // Implement signup logic here
    // For example, you can set isLoading to true, call an API, and handle the response
  }
}

final signupViewModelProvider =
    StateNotifierProvider.autoDispose<SignupViewModel, SingupState>(
      (ref) => SignupViewModel(),
    );
