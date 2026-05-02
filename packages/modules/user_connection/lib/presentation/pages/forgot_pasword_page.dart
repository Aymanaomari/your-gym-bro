import 'package:core/main.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/widgets/snack_bar/ygb_v0_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:user_connection/presentation/viewmodel/forgot_password_viewmodel.dart';

class ForgotPaswordPage extends StatefulWidget {
  const ForgotPaswordPage({
    super.key,
    this.onBackPressed,
    this.onEmailSubmitted,
  });

  final void Function()? onBackPressed;
  final void Function(String email)? onEmailSubmitted;

  @override
  State<ForgotPaswordPage> createState() => _ForgotPaswordPageState();
}

class _ForgotPaswordPageState extends State<ForgotPaswordPage> {
  late final ForgotPasswordViewmodel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CoreDIResolver.getInstance()
        .resolve<ForgotPasswordViewmodel>();
    _viewModel.errorMessage.addListener(_showErrorSnackBar);
  }

  void _showErrorSnackBar() {
    final errorMessage = _viewModel.errorMessage.value;
    if (!mounted || errorMessage == null) {
      return;
    }

    final messenger = ScaffoldMessenger.of(context);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: YgbV0SnackBar(
            message: errorMessage,
            type: SnackBarType.error,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  @override
  void dispose() {
    _viewModel.errorMessage.removeListener(_showErrorSnackBar);
    _viewModel.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ForgotPaswordPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).ygbSpacing;
    final colors = Theme.of(context).ygbColors;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: widget.onBackPressed,
              child: SizedBox(
                height: 70,
                width: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: colors.neutral100,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),

            Text(
              "FORGOT_PASSWORD_TITLE".tr(),
              style: textTheme.titleMedium?.copyWith(
                color: colors.neutral100,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "FORGOT_PASSWORD_TAGLINE".tr(),
              style: textTheme.bodyMedium?.copyWith(color: colors.neutral400),
            ),
            SizedBox(height: spacing.xxl),
            ValueListenableBuilder<bool>(
              valueListenable: _viewModel.isError,
              builder: (context, isError, _) {
                return YGBV0AppTextInput(
                  hintText: "FORGOT_PASSWORD_EMAIL_HINT".tr(),
                  controller: _viewModel.emailTextEditingController,
                  prefixIcon: Icons.email_outlined,
                  isError: isError,
                );
              },
            ),
            SizedBox(height: spacing.xxl),
            ValueListenableBuilder<bool>(
              valueListenable: _viewModel.isLoading,
              builder: (context, isLoading, _) {
                return YgbV0AppButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          _viewModel.resetPassword();
                          if (!_viewModel.isError.value) {
                            widget.onEmailSubmitted?.call(
                              _viewModel.emailTextEditingController.text.trim(),
                            );
                          }
                        },
                  text: "FORGOT_PASSWORD_BUTTON".tr(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
