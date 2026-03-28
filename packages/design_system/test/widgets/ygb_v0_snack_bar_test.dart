import 'package:design_system/theme/ygb_v0_theme/ygb_v0_theme.dart';
import 'package:design_system/widgets/snack_bar/ygb_v0_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final theme = YGBV0ThemeLight().themeData;

  testWidgets('info variant uses primary styling and prefix', (tester) async {
    const message = 'System ready';

    await tester.pumpWidget(
      _wrapWithTheme(theme, const YgbV0SnackBar(message: message)),
    );

    final card = tester.widget<Card>(find.byType(Card));
    final shape = card.shape as RoundedRectangleBorder;
    final text = tester.widget<Text>(find.text('Info: $message'));
    final icon = tester.widget<Icon>(find.byIcon(Icons.info_outline));

    expect(card.color, equals(theme.ygbColors.primary200));
    expect(shape.side.color, equals(theme.ygbColors.primary700));
    expect(text.style?.color, equals(theme.ygbColors.primary700));
    expect(icon.color, equals(theme.ygbColors.primary700));
  });

  testWidgets('warning variant swaps to amber palette', (tester) async {
    const message = 'Heads up';

    await tester.pumpWidget(
      _wrapWithTheme(
        theme,
        const YgbV0SnackBar(
          message: message,
          type: SnackBarType.warning,
        ),
      ),
    );

    final card = tester.widget<Card>(find.byType(Card));
    final text = tester.widget<Text>(find.text('Warning: $message'));
    final icon = tester.widget<Icon>(find.byIcon(Icons.warning_amber_outlined));

    expect(card.color, equals(const Color(0xFFF8F3D6)));
    expect(text.style?.color, equals(const Color(0xFFF57C00)));
    expect(icon.color, equals(const Color(0xFFF57C00)));
  });

  testWidgets('snack bar expands to the width of its parent', (tester) async {
    await tester.pumpWidget(
      _wrapWithTheme(
        theme,
        const SizedBox(
          width: 300,
          child: YgbV0SnackBar(message: 'Stretch me'),
        ),
      ),
    );

    final constrainedFinder = find.descendant(
      of: find.byType(YgbV0SnackBar),
      matching: find.byType(ConstrainedBox),
    );

    final constrainedSize = tester.getSize(constrainedFinder);
    expect(constrainedSize.width, equals(300));
  });
}

Widget _wrapWithTheme(ThemeData theme, Widget child) {
  return MaterialApp(
    theme: theme,
    home: MediaQuery(
      data: const MediaQueryData(size: Size(375, 812)),
      child: Scaffold(body: Center(child: child)),
    ),
  );
}
