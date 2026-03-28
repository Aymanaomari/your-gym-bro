import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'onboarding_view_model.dart';

final onboardingViewModelProvider =
    NotifierProvider.autoDispose<OnboardingViewModel, OnboardingViewState>(
      OnboardingViewModel.new,
    );
