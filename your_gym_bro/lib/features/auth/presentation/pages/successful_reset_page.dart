import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_gym_bro/core/constants/assets.dart';
import 'package:your_gym_bro/core/utils/double_extensions.dart';
import 'package:ygb_sdk/ygb_sdk.dart';

class SuccessfulResetPage extends ConsumerStatefulWidget {
  const SuccessfulResetPage({super.key});
  static const String routeName = "successful_reset";
  static const String routePath = "/successful_reset";
  static const String routeDisplayName = "Successful Reset";

  @override
  ConsumerState<SuccessfulResetPage> createState() =>
      _SuccessfulResetPageState();
}

class _SuccessfulResetPageState extends ConsumerState<SuccessfulResetPage> {
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
              Container(
                height: 96,
                width: 196,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.ygbColors.primary500,
                ),
                child: Icon(
                  Icons.check,
                  color: theme.ygbColors.primary50,
                  size: 64,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
