import 'package:design_system/widgets/otp-input/ygb_v0_app_otp_input.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'App OTP Input', type: YGBV0AppOtpInput)
Widget buildYgbV0AppOtpInput(BuildContext context) {
  return const _OtpInputUseCase();
}

class _OtpInputUseCase extends StatefulWidget {
  const _OtpInputUseCase();

  @override
  State<_OtpInputUseCase> createState() => _OtpInputUseCaseState();
}

class _OtpInputUseCaseState extends State<_OtpInputUseCase> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = context.knobs.boolean(
      label: "Has Error",
      initialValue: false,
    );

    return Center(
      child: YGBV0AppOtpInput(
        controller: _controller,
        onCompleted: (value) => print(value),
        hasError: hasError,
      ),
    );
  }
}
