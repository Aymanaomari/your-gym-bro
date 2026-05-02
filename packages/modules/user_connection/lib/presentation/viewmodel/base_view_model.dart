import 'package:flutter/material.dart';

mixin BaseViewModel {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<bool> isError = ValueNotifier(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier<String?>(null);

  void resetState() {
    isLoading.value = false;
    isError.value = false;
    errorMessage.value = null;
  }

  void setLoading(bool value) {
    isLoading.value = value;
  }

  void setError(String message) {
    errorMessage.value = message;
    isError.value = true;
    isLoading.value = false;
  }

  void clearError() {
    isError.value = false;
    errorMessage.value = null;
  }

  @mustCallSuper
  void disposeBase() {
    isLoading.dispose();
    isError.dispose();
    errorMessage.dispose();
  }
}
