import 'package:design_system/theme/ygb_v0_theme/ygb_v0_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OAuthGroup extends StatelessWidget {
  const OAuthGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).ygbColors;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          minWidth: 60,
          height: 60,
          padding: EdgeInsets.zero,
          onPressed: () {},
          color: colors.primary900,
          shape: const CircleBorder(),
          child: _facebookIcon(),
        ),
        const SizedBox(width: 20),
        MaterialButton(
          minWidth: 60,
          height: 60,
          padding: EdgeInsets.zero,
          onPressed: () {},
          color: colors.primary900,
          shape: const CircleBorder(),
          child: _googleIcon(),
        ),
      ],
    );
  }

  Widget _facebookIcon() {
    return SvgPicture.asset(
      'assets/images/auth/facebook.svg',
      package: 'user_connection',
      width: 24,
      height: 24,
    );
  }

  Widget _googleIcon() {
    return SvgPicture.asset(
      'assets/images/auth/google.svg',
      package: 'user_connection',
      width: 24,
      height: 24,
    );
  }
}
