import 'package:design_system/theme/ygb_v0_theme/ygb_v0_theme.dart';
import 'package:design_system/widgets/button/ygb_v0_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrapWithTheme(ThemeData theme, Widget child) {
  return MaterialApp(
    theme: theme,
    home: MediaQuery(
      data: const MediaQueryData(size: Size(375, 812)),
      child: Scaffold(body: Center(child: child)),
    ),
  );
}

void main() {
  final theme = YGBV0ThemeLight().themeData;

  testWidgets('applies primary filled styles by default', (tester) async {
    await tester.pumpWidget(
      _wrapWithTheme(theme, YgbV0AppButton(onPressed: () {}, text: 'Continue')),
    );

    final materialButton = tester.widget<MaterialButton>(
      find.byType(MaterialButton),
    );
    final textWidget = tester.widget<Text>(find.text('Continue'));
    final shape = materialButton.shape as RoundedRectangleBorder;

    expect(materialButton.color, equals(theme.ygbColors.primary500));
    expect(materialButton.elevation, equals(2));
    expect(shape.side.style, BorderStyle.none);
    expect(textWidget.style?.color, equals(theme.ygbColors.primary50));
  });

  testWidgets(
    'outlined secondary button removes fill and applies border color',
    (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          const YgbV0AppButton(
            onPressed: _noop,
            text: 'Cancel',
            outlined: true,
            type: ButtonStyleVariant.secondary,
          ),
        ),
      );

      final materialButton = tester.widget<MaterialButton>(
        find.byType(MaterialButton),
      );
      final textWidget = tester.widget<Text>(find.text('Cancel'));
      final shape = materialButton.shape as RoundedRectangleBorder;

      expect(materialButton.color, equals(Colors.transparent));
      expect(materialButton.elevation, equals(0));
      expect(shape.side.color, equals(theme.ygbColors.primary700));
      expect(textWidget.style?.color, equals(theme.ygbColors.primary700));
    },
  );
}

void _noop() {}
