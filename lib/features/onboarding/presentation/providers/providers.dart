import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingViewState {
  const OnboardingViewState({this.currentPage = 0, this.totalPages = 2});

  final int currentPage;
  final int totalPages;

  OnboardingViewState copyWith({int? currentPage, int? totalPages}) {
    return OnboardingViewState(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}

class OnboardingViewModel extends Notifier<OnboardingViewState> {
  late final PageController pageController;

  @override
  OnboardingViewState build() {
    pageController = PageController();
    ref.onDispose(pageController.dispose);

    return const OnboardingViewState();
  }

  void onPageChanged(int index) {
    state = state.copyWith(currentPage: index);
  }

  Future<void> onContinuePressed() async {
    if (state.currentPage >= state.totalPages - 1) {
      return;
    }

    await pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

final onboardingViewModelProvider =
    NotifierProvider.autoDispose<OnboardingViewModel, OnboardingViewState>(
      OnboardingViewModel.new,
    );
