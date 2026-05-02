import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ygb_sdk/ygb_sdk.dart';
import 'package:your_gym_bro/features/user_connection/signin_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static const String routeName = "/signup";
  static const String routePath = "/signup";
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserConnectionFactory().signupPage(
        onSignInPressed: () {
          context.goNamed(SigninPage.routeName);
        },
      ),
    );
  }
}
