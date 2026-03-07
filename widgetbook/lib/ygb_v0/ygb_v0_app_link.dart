import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:your_gym_bro/shared/widgets/link/ygb_v0_app_link.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'App Button', type: YgbV0AppLink)
Widget buildYgbV0AppLink(BuildContext context) {
  final type = context.knobs.object.dropdown(
    label: 'Button Type',
    options: ButtonStyleVariant.values,
    description: "The style variant of the button.",
  );

  final isUnderlined = context.knobs.boolean(
    label: 'Underlined',
    initialValue: true,
    description: "Whether the link text is underlined.",
  );

  return Center(
    child: YgbV0AppLink(
      type: type,
      text: 'Click me',
      onPressed: () {},
      isUnderlined: isUnderlined,
    ),
  );
}
