import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ygb_sdk/ygb_sdk.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, this.userEmail});
  static const String routeName = "/otp";
  static const String routePath = "/otp";
  final String? userEmail;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserConnectionFactory().otpPage(
        userEmail: widget.userEmail,
        onBackPressed: () => context.pop(),
      ),
    );
  }
}
