import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:your_gym_bro/core/constants/assets.dart';
import 'package:your_gym_bro/core/utils/double_extensions.dart';
import 'package:your_gym_bro/features/auth/presentation/pages/singin_page.dart';
import 'package:ygb_sdk/ygb_sdk.dart';

class SingupPage extends ConsumerStatefulWidget {
  const SingupPage({super.key});
  static const String routeName = "singup";
  static const String routePath = "/singup";
  static const String routeDisplayName = "Singup";

  @override
  ConsumerState<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends ConsumerState<SingupPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final viewModel = ref.watch(signupViewModelProvider);

    return Scaffold(
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
              const SizedBox(height: 64),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(height: 100),

                    /// Start: Singup form
                    YGBV0AppTextInput(
                      hintText: context.tr("auth_signup_full_name_hint"),
                      controller: TextEditingController(),
                      prefixIcon: Icons.person_2_outlined,
                    ),
                    SizedBox(height: theme.ygbSpacing.lg),
                    YGBV0AppTextInput(
                      hintText: context.tr("auth_signin_email_hint"),
                      controller: TextEditingController(),
                      prefixIcon: Icons.email_outlined,
                    ),
                    SizedBox(height: theme.ygbSpacing.lg),
                    YbgV0AppPasswordInput(
                      hintText: context.tr("auth_signin_password_hint"),
                      controller: TextEditingController(),
                      prefixIcon: Icons.lock_outline,
                    ),
                    SizedBox(height: theme.ygbSpacing.lg),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          context.tr("auth_signup_terms_prefix"),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.ygbColors.primary50,
                          ),
                        ),
                        YgbV0AppLink(
                          type: LinkStyleVariant.primary,
                          text: context.tr("auth_signup_terms"),
                          onPressed: () {},
                        ),
                        Text(
                          context.tr("auth_signup_terms_and"),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.ygbColors.primary50,
                          ),
                        ),
                        YgbV0AppLink(
                          type: LinkStyleVariant.primary,
                          text: context.tr("auth_signup_privacy_policy"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: theme.ygbSpacing.lg),

                    YgbV0AppButton(
                      onPressed: () {},
                      text: context.tr("auth_signup_title"),
                      type: ButtonStyleVariant.primary,
                    ),
                    SizedBox(height: theme.ygbSpacing.xl),

                    /// End: Singup form
                    SizedBox(height: theme.ygbSpacing.xl),
                    SizedBox(height: theme.ygbSpacing.xl),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            context.tr("auth_signup_already_have_account"),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.ygbColors.primary50,
                            ),
                          ),
                          YgbV0AppLink(
                            type: LinkStyleVariant.primary,
                            text: context.tr("auth_signup_signin"),
                            onPressed: () {
                              context.replaceNamed(SinginPage.routeName);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
