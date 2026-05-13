import 'package:flutter/material.dart';
import 'package:ygb_sdk/ygb_sdk.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});
  static const String routeName = "/reset_password";
  static const String routePath = "/reset_password";

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  void didUpdateWidget(covariant ResetPasswordPage oldWidget) {
    // TODO: implement didUpdateWidget

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserConnectionFactory().resetPasswordPage(
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
