import 'package:core/main.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:user_connection/presentation/viewmodel/onboarding_view_model.dart';
import 'package:user_connection/presentation/widgets/onboarding_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key, this.onCompleted});

  final ValueChanged<bool>? onCompleted;

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _contentController = PageController();
  late final OnboardingViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CoreDIResolver.getInstance().resolve<OnboardingViewModel>();
  }

  @override
  void dispose() {
    _contentController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _viewModel.currentPageIndex,
        builder: (context, currentPage, _) {
          return _OnboardingContent(
            viewModel: _viewModel,
            contentController: _contentController,
            currentPage: currentPage,
            onCompleted: widget.onCompleted,
            onPageChanged: _viewModel.setPage,
          );
        },
      ),
    );
  }
}

class _OnboardingContent extends StatelessWidget {
  const _OnboardingContent({
    required this.viewModel,
    required this.contentController,
    required this.currentPage,
    required this.onCompleted,
    required this.onPageChanged,
  });

  final OnboardingViewModel viewModel;
  final PageController contentController;
  final int currentPage;
  final ValueChanged<bool>? onCompleted;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.ygbColors;
    final spacing = theme.ygbSpacing;
    final background = viewModel.onboardingBackgrounds[currentPage];

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            background.imagePath,
            package: 'user_connection',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0x66041320),
                  const Color(0xAA041320),
                  const Color(0xE6041320),
                ],
                stops: const [0.1, 0.55, 1],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                SizedBox(
                  height: 245,
                  child: PageView.builder(
                    controller: contentController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.onboardingBackgrounds.length,
                    onPageChanged: onPageChanged,
                    itemBuilder: (context, index) {
                      final content = viewModel.onboardingBackgrounds[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: theme.textTheme.displayLarge?.copyWith(
                                fontSize: 45,
                                height: 1.1,
                                fontStyle: FontStyle.italic,
                              ),
                              children: [
                                TextSpan(text: content.titleKey.tr()),
                                if (content.highlightedTitleKey != null)
                                  TextSpan(
                                    text: content.highlightedTitleKey!.tr(),
                                    style: theme.textTheme.displayLarge
                                        ?.copyWith(
                                          fontSize: 45,
                                          height: 1.1,
                                          fontStyle: FontStyle.italic,
                                          color: colors.primary500,
                                        ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: spacing.sm),
                          Text(
                            content.descriptionKey.tr(),
                            style: theme.textTheme.titleSmall?.copyWith(
                              height: 1.25,
                            ),
                          ),
                          SizedBox(height: spacing.xxl),
                          YgbV0AppButton(
                            onPressed: () async {
                              final isLastPage =
                                  index ==
                                  viewModel.onboardingBackgrounds.length - 1;

                              if (!isLastPage) {
                                contentController.nextPage(
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.easeOut,
                                );
                                return;
                              }

                              await viewModel.completeOnboarding();
                              final isCompleted =
                                  viewModel.isCompleted.value ?? false;

                              if (isCompleted) {
                                onCompleted?.call(true);
                              }
                            },
                            text: content.buttonKey.tr(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: spacing.md),
                OnboardingIndicator(currentPage: currentPage),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
