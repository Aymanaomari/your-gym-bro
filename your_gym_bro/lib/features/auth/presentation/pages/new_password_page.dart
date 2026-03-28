import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_gym_bro/core/constants/assets.dart';
import 'package:your_gym_bro/core/utils/double_extensions.dart';
import 'package:ygb_sdk/ygb_sdk.dart';

class NewPasswordPage extends ConsumerStatefulWidget {
  const NewPasswordPage({super.key});
  static const String routeName = "new_password";
  static const String routePath = "/new_password";
  static const String routeDisplayName = "New Password";

  @override
  ConsumerState<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends ConsumerState<NewPasswordPage> {
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
                context.tr("auth_new_password_title"),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.ygbColors.primary50,
                ),
              ),
              Text(
                context.tr("auth_new_password_subtitle"),
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.ygbColors.primary50.withAlpha(100),
                ),
              ),
              SizedBox(height: theme.ygbSpacing.xxl),
              YbgV0AppPasswordInput(
                hintText: context.tr("auth_new_password_enter_hint"),
                controller: TextEditingController(),
              ),
              SizedBox(height: theme.ygbSpacing.lg),
              YbgV0AppPasswordInput(
                hintText: context.tr("auth_new_password_confirm_hint"),
                controller: TextEditingController(),
              ),

              SizedBox(height: theme.ygbSpacing.xl),
              YgbV0AppButton(
                onPressed: () {},
                type: ButtonStyleVariant.primary,
                text: context.tr("auth_new_password_update_button"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
