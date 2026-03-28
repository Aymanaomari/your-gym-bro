import 'package:design_system/widgets/text_input/ygb_v0_app_text_input.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'App Text Input', type: YGBV0AppTextInput)
Widget buildYgbV0AppTextInput(BuildContext context) {
  final hintText = context.knobs.string(
    label: 'Hint Text',
    initialValue: 'Enter your Email',
    description: "The hint displayed inside the text input.",
  );

  final prefixIcon = context.knobs.objectOrNull.dropdown<IconData?>(
    label: 'Prefix Icon',
    options: [null, Icons.email_outlined, Icons.person, Icons.lock],
    description: "The icon displayed at the start of the text input.",
  );

  final isError = context.knobs.boolean(
    label: 'Is Error',
    initialValue: false,
    description: "Whether the text input is in an error state.",
  );

  return _YgbV0TextInputUseCase(
    hintText: hintText,
    prefixIcon: prefixIcon,
    isError: isError,
  );
}

class _YgbV0TextInputUseCase extends StatefulWidget {
  const _YgbV0TextInputUseCase({
    required this.hintText,
    required this.prefixIcon,
    required this.isError,
  });

  final String hintText;
  final IconData? prefixIcon;
  final bool isError;

  @override
  State<_YgbV0TextInputUseCase> createState() => _YgbV0TextInputUseCaseState();
}

class _YgbV0TextInputUseCaseState extends State<_YgbV0TextInputUseCase> {
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
      child: YGBV0AppTextInput(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        isError: widget.isError,
        controller: _controller,
      ),
    );
  }
}
