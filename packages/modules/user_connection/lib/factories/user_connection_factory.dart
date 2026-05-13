import 'package:flutter/material.dart';
import 'package:user_connection/presentation/pages/forgot_pasword_page.dart';
import 'package:user_connection/presentation/pages/otp_page.dart';
import 'package:user_connection/presentation/pages/reset_password_page.dart';
import 'package:user_connection/presentation/pages/signin_page.dart';
import 'package:user_connection/presentation/pages/signup_page.dart';

class UserConnectionFactory {
  Widget signingPage({
    required void Function() onSignUpPressed,
    required void Function() onForgotPasswordPressed,
  }) {
    return SigninPage(
      onSignUpPressed: onSignUpPressed,
      onForgotPasswordPressed: onForgotPasswordPressed,
    );
  }

  Widget signupPage({required void Function() onSignInPressed}) {
    return SignupPage(onSignInPressed: onSignInPressed);
  }

  Widget forgotPasswordPage({
    void Function()? onBackPressed,
    void Function(String email)? onEmailSubmitted,
  }) {
    return ForgotPaswordPage(
      onBackPressed: onBackPressed,
      onEmailSubmitted: onEmailSubmitted,
    );
  }

  Widget otpPage({String? userEmail, void Function()? onBackPressed}) {
    return OtpPage(userEmail: userEmail, onBackPressed: onBackPressed);
  }

  Widget resetPasswordPage({void Function()? onBackPressed}) {
    return ResetPasswordPage(onBackPressed: onBackPressed);
  }
}
