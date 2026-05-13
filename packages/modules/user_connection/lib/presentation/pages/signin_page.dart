import 'package:base_module/presentation/snackbar_mixin.dart';
import 'package:core/main.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/widgets/snack_bar/ygb_v0_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:user_connection/presentation/viewmodel/signin_view_model.dart';
import 'package:user_connection/presentation/widgets/auth_header.dart';
import 'package:user_connection/presentation/widgets/oauth_group.dart';

typedef SignInCallback = void Function();

class SigninPage extends StatefulWidget {
  const SigninPage({
    super.key,
    required this.onSignUpPressed,
    required this.onForgotPasswordPressed,
  });
  final SignInCallback onSignUpPressed;
  final SignInCallback onForgotPasswordPressed;

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> with SnackbarMixin {
  late final SigninViewModel _viewModel;
  late void Function() _showErrorSnackBar;

  @override
  void initState() {
    super.initState();
    _viewModel = CoreDIResolver.getInstance().resolve<SigninViewModel>();
    _showErrorSnackBar = () => showErrorSnackbar(
      context,
      message: _viewModel.errorMessage.value ?? '',
    );
    _viewModel.errorMessage.addListener(_showErrorSnackBar);
  }

  @override
  void dispose() {
    _viewModel.errorMessage.removeListener(_showErrorSnackBar);
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).ygbSpacing;

    return SafeArea(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing.xl),
          child: Column(
            children: [
              SizedBox(height: 48),
              AuthHeader(
                signInTagline: "SIGN_IN_TAGLINE".tr(),
                signInPrefix: "SIGN_IN_PREFIX".tr(),
                signInHighlight: "SIGN_IN_HIGHLIGHT".tr(),
              ),
              SizedBox(height: 120),
              ValueListenableBuilder<bool>(
                valueListenable: _viewModel.isError,
                builder: (context, isError, _) {
                  return YGBV0AppTextInput(
                    prefixIcon: Icons.email_outlined,
                    hintText: "SIGN_IN_EMAIL_HINT".tr(),
                    controller: _viewModel.emailController,
                    isError: isError,
                  );
                },
              ),
              SizedBox(height: spacing.xl),
              ValueListenableBuilder<bool>(
                valueListenable: _viewModel.isError,
                builder: (context, isError, _) {
                  return YGBV0AppPasswordInput(
                    prefixIcon: Icons.lock_outline,
                    hintText: "SIGN_IN_PASSWORD_HINT".tr(),
                    controller: _viewModel.passwordController,
                    isError: isError,
                  );
                },
              ),
              SizedBox(height: spacing.xs),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  YGBV0AppLink(
                    type: LinkStyleVariant.primary,
                    onPressed: widget.onForgotPasswordPressed,
                    text: "SIGN_IN_FORGOT_PASSWORD".tr(),
                  ),
                ],
              ),
              SizedBox(height: spacing.md),
              ValueListenableBuilder<bool>(
                valueListenable: _viewModel.isLoading,
                builder: (context, isLoading, _) {
                  return YgbV0AppButton(
                    text: "SIGN_IN_BUTTON".tr(),
                    onPressed: _viewModel.signin,
                  );
                },
              ),
              SizedBox(height: spacing.lg),
              SizedBox(
                height: 52,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Divider(thickness: 0.3),
                    Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      padding: EdgeInsets.symmetric(horizontal: spacing.md),
                      child: Text(
                        "OR_CONTINUE_WITH".tr(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).ygbColors.neutral500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              OAuthGroup(),
              SizedBox(height: spacing.xl),
              Row(
                spacing: spacing.xs,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SIGN_IN_NO_ACCOUNT".tr(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).ygbColors.neutral400,
                    ),
                  ),
                  YGBV0AppLink(
                    type: LinkStyleVariant.primary,
                    text: "SIGN_IN_SIGN_UP".tr(),
                    onPressed: widget.onSignUpPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
