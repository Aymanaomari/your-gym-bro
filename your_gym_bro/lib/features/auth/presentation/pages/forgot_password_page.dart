import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_gym_bro/core/constants/assets.dart';
import 'package:your_gym_bro/core/utils/double_extensions.dart';
import 'package:ygb_sdk/ygb_sdk.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});
  static const String routeName = "forgot_password";
  static const String routePath = "/forgot_password";
  static const String routeDisplayName = "Forgot Password";

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: theme.ygbColors.primary50),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        width: 100.vw(context),
        padding: EdgeInsets.symmetric(horizontal: theme.ygbSpacing.xl),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.bgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              Text(
                context.tr("auth_forgot_password_title"),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.ygbColors.primary50,
                ),
              ),
              Text(
                context.tr("auth_forgot_password_subtitle"),
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.ygbColors.primary50.withAlpha(100),
                ),
              ),
              SizedBox(height: theme.ygbSpacing.xxl),
              YGBV0AppTextInput(
                hintText: context.tr("auth_signin_email_hint"),
                prefixIcon: Icons.email_outlined,
                controller: TextEditingController(),
              ),
              SizedBox(height: theme.ygbSpacing.xl),
              YgbV0AppButton(
                onPressed: () {},
                type: ButtonStyleVariant.primary,
                text: context.tr("auth_forgot_password_reset_button"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
