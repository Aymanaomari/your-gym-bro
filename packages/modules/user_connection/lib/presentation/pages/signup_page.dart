import 'package:core/main.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:user_connection/presentation/widgets/auth_header.dart';
import 'package:user_connection/presentation/widgets/oauth_group.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.onSignInPressed});

  final void Function() onSignInPressed;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                signInTagline: "SIGN_UP_TAGLINE".tr(),
                signInPrefix: "SIGN_UP_PREFIX".tr(),
                signInHighlight: "SIGN_UP_HIGHLIGHT".tr(),
              ),
              SizedBox(height: 96),
              YGBV0AppTextInput(
                prefixIcon: Icons.person_outline,
                hintText: "SIGN_UP_FULL_NAME_HINT".tr(),
                controller: TextEditingController(),
              ),
              SizedBox(height: spacing.xl),
              YGBV0AppTextInput(
                prefixIcon: Icons.email_outlined,
                hintText: "SIGN_UP_EMAIL_HINT".tr(),
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: spacing.xl),
              YGBV0AppPasswordInput(
                prefixIcon: Icons.lock_outline,
                hintText: "SIGN_UP_PASSWORD_HINT".tr(),
                controller: TextEditingController(),
              ),
              SizedBox(height: spacing.lg),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing.xs),
                child: Text.rich(
                  TextSpan(
                    text: "SIGN_UP_TERMS_PREFIX".tr(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).ygbColors.neutral400,
                    ),
                    children: [
                      TextSpan(
                        text: "SIGN_UP_TERMS_LINK".tr(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).ygbColors.primary500,
                        ),
                      ),
                      TextSpan(
                        text: "SIGN_UP_AND".tr(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).ygbColors.neutral400,
                        ),
                      ),
                      TextSpan(
                        text: "SIGN_UP_PRIVACY_LINK".tr(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).ygbColors.primary500,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: spacing.xl),
              YgbV0AppButton(text: "SIGN_UP_BUTTON".tr(), onPressed: () {}),
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
                        "SIGN_UP_OR_CONTINUE_WITH".tr(),
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
                    "SIGN_UP_HAVE_ACCOUNT".tr(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).ygbColors.neutral400,
                    ),
                  ),
                  YGBV0AppLink(
                    type: LinkStyleVariant.primary,
                    text: "SIGN_UP_SIGN_IN".tr(),
                    onPressed: widget.onSignInPressed,
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
