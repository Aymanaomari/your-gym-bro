import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:your_gym_bro/core/constants/assets.dart';
import 'package:your_gym_bro/core/utils/double_extensions.dart';
import 'package:your_gym_bro/shared/widgets/input_fields/ygb_v0_app_input_field.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_theme.dart';

class SinginPage extends StatefulWidget {
  const SinginPage({super.key});

  static const String routeName = "singin";
  static const String routePath = "/singin";
  static const String routeDisplayName = "Singin";

  @override
  State<SinginPage> createState() => _SinginPageState();
}

class _SinginPageState extends State<SinginPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        width: 100.vw(context),
        padding: EdgeInsets.symmetric(horizontal: theme.ygbSpacing.md),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.bgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 72),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: context.tr("auth_signin_title_prefix"),
                        style: Theme.of(context).textTheme.displayMedium
                            ?.copyWith(color: Colors.white),
                        children: [
                          TextSpan(
                            text: context.tr("auth_signin_title_suffix"),
                            style: Theme.of(context).textTheme.displayMedium
                                ?.copyWith(
                                  color: theme.ygbColors.primary500,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Text(context.tr("auth_signin_subtitle")),
                    SizedBox(height: theme.ygbSpacing.lg),
                    YgbV0AppInputField(labelText: "Enter Email"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
