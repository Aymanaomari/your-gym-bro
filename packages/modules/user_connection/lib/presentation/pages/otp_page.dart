import 'package:core/main.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

typedef BackCallback = void Function()?;

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, this.onBackPressed, this.userEmail});

  final BackCallback? onBackPressed;
  final String? userEmail;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
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
              "OTP_TITLE".tr(),
              style: textTheme.titleMedium?.copyWith(
                color: colors.neutral100,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: spacing.xs),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "OTP_SUBTITLE".tr(),
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.neutral400,
                    ),
                  ),

                  TextSpan(
                    text: " ${widget.userEmail}",
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.primary400,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing.xl),
            YGBV0AppOtpInput(
              onCompleted: (value) {},
              controller: TextEditingController(),
            ),
            SizedBox(height: spacing.xl),
            YgbV0AppButton(onPressed: () {}, text: "VERIFY_OTP_CODE".tr()),
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
                  text: "Resend it",
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
