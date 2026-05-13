import 'package:flutter/material.dart';

mixin BaseViewModel {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<bool> isError = ValueNotifier(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier<String?>(null);
  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  void resetState() {
    if (_isDisposed) return;
    isLoading.value = false;
    isError.value = false;
    errorMessage.value = null;
  }

  void setLoading(bool value) {
    if (_isDisposed) return;
    isLoading.value = value;
  }

  void setError(String message) {
    if (_isDisposed) return;
    errorMessage.value = message;
    isError.value = true;
    isLoading.value = false;
  }

  void clearError() {
    if (_isDisposed) return;
    isError.value = false;
    errorMessage.value = null;
  }

  @mustCallSuper
  void disposeBase() {
    if (_isDisposed) return;
    _isDisposed = true;
    isLoading.dispose();
    isError.dispose();
    errorMessage.dispose();
  }
}
