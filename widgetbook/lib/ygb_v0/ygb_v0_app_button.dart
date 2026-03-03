import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:your_gym_bro/shared/widgets/button/ygb_v0_app_button.dart';

@widgetbook.UseCase(name: 'App Button', type: YgbV0AppButton)
Widget buildYgbV0AppButton(BuildContext context) {
  final text = context.knobs.string(
    label: 'Button Text',
    initialValue: 'Click Me',
    description: "The text displayed on the button.",
  );

  final outlined = context.knobs.boolean(
    label: 'Outlined',
    initialValue: false,
    description: "Whether the button is outlined or filled.",
  );

  final type = context.knobs.object.segmented(
    label: 'Button Type',
    options: ButtonStyleVariant.values,
    description: "The style variant of the button.",
  );

  return Center(
    child: YgbV0AppButton(
      onPressed: () {},
      text: text,
      outlined: outlined,
      type: type,
    ),
  );
}
