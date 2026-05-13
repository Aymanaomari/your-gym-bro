import 'package:base_module/presentation/snackbar_mixin.dart';
import 'package:core/main.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:user_connection/presentation/viewmodel/reset_password_viewmodel.dart';

typedef BackCallback = void Function()?;

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key, this.onBackPressed});

  final BackCallback? onBackPressed;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage>
    with SnackbarMixin {
  late final ResetPasswordViewmodel _viewModel;
  late void Function() _showErrorSnackBar;

  @override
  void initState() {
    super.initState();
    _viewModel = CoreDIResolver.getInstance().resolve<ResetPasswordViewmodel>();
    _showErrorSnackBar = () => showErrorSnackbar(
      context,
      message: _viewModel.errorMessage.value ?? '',
    );
    _viewModel.errorMessage.addListener(_showErrorSnackBar);
  }

  @override
  void dispose() {
    _viewModel.errorMessage.removeListener(_showErrorSnackBar);
    super.dispose();
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
              onTap: widget.onBackPressed?.call,
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
              "RESET_PASSWORD_TITLE".tr(),
              style: textTheme.titleMedium?.copyWith(
                color: colors.neutral100,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: spacing.xs),
            Text(
              "RESET_PASSWORD_SUBTITLE".tr(),
              style: textTheme.bodyMedium?.copyWith(color: colors.neutral400),
            ),
            SizedBox(height: spacing.xxl),
            YGBV0AppPasswordInput(
              hintText: "PASSWORD_HINT".tr(),
              controller: _viewModel.newPasswordController,
            ),
            SizedBox(height: spacing.xl),
            YGBV0AppPasswordInput(
              hintText: "CONFIRM_PASSWORD_HINT".tr(),
              controller: _viewModel.confirmPasswordController,
            ),
            SizedBox(height: spacing.xxl),
            YgbV0AppButton(
              onPressed: _viewModel.resetPassword,
              text: "RESET_PASSWORD".tr(),
            ),
            SizedBox(height: spacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: spacing.xs,
              children: [
                Text(
                  "DIDNT_RECEIVE_CODE".tr(),
                  style: textTheme.bodyMedium?.copyWith(
                    color: colors.neutral300,
                  ),
                ),
                YGBV0AppLink(
                  type: LinkStyleVariant.primary,
                  text: "RESEND_IT".tr(),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
