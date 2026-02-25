import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:your_gym_bro/core/constants/assets.dart';
import 'package:your_gym_bro/core/i18n/internationalization_extension.dart';
import 'package:your_gym_bro/core/utils/double_extensions.dart';
import 'package:your_gym_bro/features/auth/presentation/pages/singin_page.dart';
import 'package:your_gym_bro/features/onboarding/presentation/providers/providers.dart';
import 'package:your_gym_bro/features/onboarding/presentation/widgets/onboarding_text_block.dart';
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onboardingState = ref.watch(onboardingViewModelProvider);
    final onboardingViewModel = ref.read(onboardingViewModelProvider.notifier);

    final pages =
        <({String title, String highlightedTitle, String description})>[
          (
            title: context.tr("onboarding_Welcome_To_Your_Gym"),
            highlightedTitle: context.tr("onboarding_app_name_suffix"),
            description: context.tr("onboarding_tagline"),
          ),
          (
            title: context.tr("onboarding_second_title"),
            highlightedTitle: context.tr("onboarding_second_highlight"),
            description: context.tr("onboarding_second_tagline"),
          ),
        ];

    final isLastPage = onboardingState.currentPage == pages.length - 1;

    return Scaffold(
      body: Container(
        width: 100.vw(context),
        padding: EdgeInsets.symmetric(horizontal: theme.ygbSpacing.md),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              isLastPage ? Assets.onBoardingImage2 : Assets.onBoardingImage1,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 28.hv(context),
                child: PageView.builder(
                  controller: onboardingViewModel.pageController,
                  onPageChanged: onboardingViewModel.onPageChanged,
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    final page = pages[index];

                    return OnboardingTextBlock(
                      title: page.title,
                      highlightedTitle: page.highlightedTitle,
                      description: page.description,
                    );
                  },
                ),
              ),
              SizedBox(height: theme.ygbSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(pages.length, (index) {
                  final isActive = onboardingState.currentPage == index;

                  return Container(
                    width: isActive ? 14 : 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(
                      horizontal: theme.ygbSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: isActive
                          ? theme.ygbColors.primary50
                          : theme.ygbColors.primary50.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                }),
              ),
              SizedBox(height: theme.ygbSpacing.lg),
              YgbV0AppButton(
                onPressed: () {
                  if (!isLastPage) {
                    onboardingViewModel.onContinuePressed();
                    return;
                  }
                  context.goNamed(SinginPage.routeName);
                },
                text: isLastPage
                    ? context.tr("onboarding_start_training")
                    : context.tr("onboarding_next"),
              ),
              SizedBox(height: theme.ygbSpacing.sm),
            ],
          ),
        ),
      ),
    );
  }
}
