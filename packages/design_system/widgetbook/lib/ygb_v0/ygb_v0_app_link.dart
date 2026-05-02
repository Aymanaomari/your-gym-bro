import 'package:design_system/widgets/link/ygb_v0_app_link.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'App Link', type: YGBV0AppLink)
Widget buildYgbV0AppLink(BuildContext context) {
  final type = context.knobs.object.dropdown(
    label: 'Link Type',
    labelBuilder: (value) => value.name,
    options: [
      LinkStyleVariant.primary,
      LinkStyleVariant.secondary,
      LinkStyleVariant.danger,
    ],
    description: "The style variant of the link.",
  );

  final fontSize = context.knobs.doubleOrNull.slider(
    label: 'Font Size',
    initialValue: 14,
    min: 10,
    max: 30,
    description: "The font size of the link text.",
  );

  final isUnderlined = context.knobs.boolean(
    label: 'Underlined',
    initialValue: true,
    description: "Whether the link text is underlined.",
  );

  return Center(
    child: YGBV0AppLink(
      type: type,
      text: 'Click me',
      onPressed: () {},
      isUnderlined: isUnderlined,
      fontSize: fontSize,
    ),
  );
}
