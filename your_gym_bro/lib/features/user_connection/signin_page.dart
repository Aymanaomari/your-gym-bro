import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ygb_sdk/ygb_sdk.dart';
import 'package:your_gym_bro/features/user_connection/forgot_password_page.dart';
import 'package:your_gym_bro/features/user_connection/signup_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  static const String routeName = "/signin";
  static const String routePath = "/signin";

  @override
  State<SigninPage> createState() => _SigningPageState();
}

class _SigningPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserConnectionFactory().signingPage(
        onSignUpPressed: () {
          // Handle sign up pressed
          context.goNamed(SignupPage.routeName);
        },
        onForgotPasswordPressed: () {
          // Handle forgot password pressed
          context.pushNamed(ForgotPasswordPage.routeName);
        },
      ),
    );
  }
}
