import 'package:design_system/widgets/snack_bar/ygb_v0_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'App Button', type: YgbV0SnackBar)
Widget buildYgbV0AppButton(BuildContext context) {
  final message = context.knobs.string(
    label: 'Message',
    initialValue: 'This is a description of the SnackBar',
    description: "The message displayed in the SnackBar.",
  );

  final variant = context.knobs.object.segmented(
    label: 'Variant',
    options: SnackBarType.values,
    description: "The style variant of the SnackBar.",
  );

  return Center(
    child: YgbV0SnackBar(message: message, type: variant),
  );
}
