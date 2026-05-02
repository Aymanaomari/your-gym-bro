import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ygb_sdk/ygb_sdk.dart';
import 'package:your_gym_bro/features/user_connection/otp_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  static const String routeName = '/forgot-password';
  static const String routePath = '/forgot-password';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserConnectionFactory().forgotPasswordPage(
        onBackPressed: () => context.pop(),
        onEmailSubmitted: (email) => context.pushNamed(
          OtpPage.routeName,
          queryParameters: {"email": email},
        ),
      ),
    );
  }
}
