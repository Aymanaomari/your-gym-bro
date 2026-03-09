import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:your_gym_bro/shared/widgets/password_input/ybg_v0_app_password_input.dart';

@widgetbook.UseCase(name: 'App Password Input', type: YbgV0AppPasswordInput)
Widget buildYbgV0AppPasswordInput(BuildContext context) {
  final hintText = context.knobs.string(
    label: 'Hint Text',
    initialValue: 'Enter your Password',
    description: "The hint displayed inside the password input.",
  );

  final prefixIcon = context.knobs.objectOrNull.dropdown<IconData?>(
    label: 'Prefix Icon',
    options: [null, Icons.lock_outline, Icons.key, Icons.password],
    description: "The icon displayed at the start of the password input.",
  );

  final isError = context.knobs.boolean(
    label: 'Is Error',
    initialValue: false,
    description: "Whether the password input is in an error state.",
  );

  return _YbgV0PasswordInputUseCase(
    hintText: hintText,
    prefixIcon: prefixIcon,
    isError: isError,
  );
}

class _YbgV0PasswordInputUseCase extends StatefulWidget {
  const _YbgV0PasswordInputUseCase({
    required this.hintText,
    required this.prefixIcon,
    required this.isError,
  });

  final String hintText;
  final IconData? prefixIcon;
  final bool isError;

  @override
  State<_YbgV0PasswordInputUseCase> createState() =>
      _YbgV0PasswordInputUseCaseState();
}

class _YbgV0PasswordInputUseCaseState
    extends State<_YbgV0PasswordInputUseCase> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: YbgV0AppPasswordInput(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        isError: widget.isError,
        controller: _controller,
      ),
    );
  }
}
