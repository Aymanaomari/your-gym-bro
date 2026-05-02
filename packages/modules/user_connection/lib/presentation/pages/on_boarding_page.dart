import 'package:flutter/material.dart';
import 'package:user_connection/presentation/viewmodel/onboarding_view_model.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return OnboardingViewModel(child: Scaffold(body: _OnboardingContent()));
  }
}

class _OnboardingContent extends StatelessWidget {
  const _OnboardingContent();

  @override
  Widget build(BuildContext context) {
    // Access the InheritedWidget data using the of() method
    final viewModel = OnboardingViewModel.of(context);

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Current Page: ${viewModel.currentPageIndex}'),
          const SizedBox(height: 20),
          Text(
            viewModel.onboardingBackgrounds[viewModel.currentPageIndex].title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            viewModel
                .onboardingBackgrounds[viewModel.currentPageIndex]
                .description,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          // To update the ViewModel, replace it with a new one using copyWith()
          ElevatedButton(
            onPressed: () {
              final newViewModel = viewModel.copyWith(
                currentPageIndex: viewModel.currentPageIndex + 1,
              );
              // Re-render with new ViewModel (context will trigger rebuild)
              // In practice, you'd use a StatefulWidget or Provider for state updates
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Next page: ${newViewModel.currentPageIndex}'),
                ),
              );
            },
            child: const Text('Next Page'),
          ),
        ],
      ),
    );
  }
}
