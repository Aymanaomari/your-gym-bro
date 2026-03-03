import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:your_gym_bro/shared/widgets/button/ygb_v0_app_text_input.dart';

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

  return Center(
    child: YGBV0AppTextInput(
      hintText: hintText,
      prefixIcon: prefixIcon,
      isError: isError,
      controller: TextEditingController(),
    ),
  );
}
