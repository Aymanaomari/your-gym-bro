import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_gym_bro/core/constants/assets.dart';
import 'package:your_gym_bro/core/utils/double_extensions.dart';
import 'package:ygb_sdk/ygb_sdk.dart';

class OtpPage extends ConsumerStatefulWidget {
  const OtpPage({super.key, required this.email});
  static const String routeName = "otp";
  static const String routePath = "/otp";
  static const String routeDisplayName = "OTP";
  final String email;

  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
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
                context.tr("auth_otp_title"),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.ygbColors.primary50,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: context.tr("auth_otp_subtitle"),
                  children: [
                    TextSpan(
                      text: widget.email,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.ygbColors.primary500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.ygbColors.primary50.withAlpha(150),
                ),
              ),
              SizedBox(height: theme.ygbSpacing.xl),
              YGBV0AppOtpInput(
                onCompleted: (value) {
                  print(value);
                },
                controller: TextEditingController(),
              ),
              SizedBox(height: theme.ygbSpacing.xl),
              YgbV0AppButton(
                onPressed: () {},
                type: ButtonStyleVariant.primary,
                text: context.tr("auth_otp_verify_button"),
              ),
              SizedBox(height: theme.ygbSpacing.lg),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: context.tr("auth_otp_no_code"),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.ygbColors.primary50.withAlpha(150),
                        ),
                      ),
                      WidgetSpan(
                        child: YgbV0AppLink(
                          text: context.tr("auth_otp_resend"),
                          onPressed: () {},
                          type: LinkStyleVariant.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
