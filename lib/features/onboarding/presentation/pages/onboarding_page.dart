import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:your_gym_bro/core/i18n/internationalization_extension.dart';
import 'package:your_gym_bro/features/auth/presentation/pages/singin_page.dart';
import 'package:your_gym_bro/features/onboarding/presentation/pages/providers.dart';
import 'package:your_gym_bro/features/onboarding/presentation/models/onboarding_screen_data.dart';
import 'package:your_gym_bro/features/onboarding/presentation/providers/onboarding_view_mode.dart';
import 'package:your_gym_bro/features/onboarding/presentation/widgets/onboarding_background_slide.dart';
import 'package:your_gym_bro/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:your_gym_bro/shared/widgets/button/ygb_v0_app_button.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_theme.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  static const String routeName = "onboarding";
  static const String routePath = "/onboarding";
  static const String routeDisplayName = "Onboarding";

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  Future<void> _onButtonPressed({required bool isLastPage}) async {
    final onboardingViewModel = ref.read(onboardingViewModelProvider.notifier);

    if (!isLastPage) {
      await onboardingViewModel.onContinuePressed();
      return;
    }

    final markOnboardingAsCompletedUseCase = await ref.read(
      markOnboardingAsCompletedUseCaseProvider.future,
    );
    await markOnboardingAsCompletedUseCase();

    if (!mounted) {
      return;
    }

    context.go(SinginPage.routePath);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onboardingState = ref.watch(onboardingViewModelProvider);
    final onboardingViewModel = ref.read(onboardingViewModelProvider.notifier);
    final currentPageData = onboardingScreens[onboardingState.currentPage];
    final isLastPage =
        onboardingState.currentPage == onboardingScreens.length - 1;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: onboardingViewModel.pageController,
            onPageChanged: onboardingViewModel.onPageChanged,
            itemCount: onboardingScreens.length,
            itemBuilder: (context, index) {
              return OnboardingBackgroundSlide(data: onboardingScreens[index]);
            },
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(theme.ygbSpacing.lg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: context.tr(currentPageData.titleKey)),
                        TextSpan(
                          text: context.tr(currentPageData.highlightedTitleKey),
                          style: theme.textTheme.displayLarge?.copyWith(
                            color: theme.ygbColors.primary500,
                          ),
                        ),
                      ],
                    ),
                    style: theme.textTheme.displayLarge?.copyWith(
                      color: theme.ygbColors.primary50,
                    ),
                  ),
                  SizedBox(height: theme.ygbSpacing.sm),
                  Text(
                    context.tr(currentPageData.descriptionKey),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.ygbColors.primary50,
                    ),
                  ),
                  SizedBox(height: theme.ygbSpacing.lg),
                  YgbV0AppButton(
                    onPressed: () => _onButtonPressed(isLastPage: isLastPage),
                    text: context.tr(currentPageData.buttonTextKey),
                  ),
                  SizedBox(height: theme.ygbSpacing.md),
                  Align(
                    child: OnboardingPageIndicator(
                      currentPage: onboardingState.currentPage,
                      totalPages: onboardingScreens.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
