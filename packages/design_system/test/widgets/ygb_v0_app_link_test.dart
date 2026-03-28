import 'package:design_system/theme/ygb_v0_theme/ygb_v0_theme.dart';
import 'package:design_system/widgets/link/ygb_v0_app_link.dart';
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

  group('YgbV0AppLink', () {
    testWidgets('displays the provided text', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          YgbV0AppLink(
            type: LinkStyleVariant.primary,
            text: 'Sign up',
            onPressed: () {},
          ),
        ),
      );

      expect(find.text('Sign up'), findsOneWidget);
    });

    testWidgets('primary variant uses primary400 color', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          YgbV0AppLink(
            type: LinkStyleVariant.primary,
            text: 'Link',
            onPressed: () {},
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Link'));
      expect(text.style?.color, equals(theme.ygbColors.primary400));
    });

    testWidgets('secondary variant uses primary50 color', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          YgbV0AppLink(
            type: LinkStyleVariant.secondary,
            text: 'Link',
            onPressed: () {},
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Link'));
      expect(text.style?.color, equals(theme.ygbColors.primary50));
    });

    testWidgets('danger variant uses error color', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          YgbV0AppLink(
            type: LinkStyleVariant.danger,
            text: 'Delete',
            onPressed: () {},
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Delete'));
      expect(text.style?.color, equals(theme.ygbColors.error));
    });

    testWidgets('renders with same color when onPressed is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          const YgbV0AppLink(type: LinkStyleVariant.primary, text: 'Disabled'),
        ),
      );

      final text = tester.widget<Text>(find.text('Disabled'));
      expect(text.style?.color, equals(theme.ygbColors.primary400));
    });

    testWidgets('onPressed callback is invoked on tap', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          YgbV0AppLink(
            type: LinkStyleVariant.primary,
            text: 'Tap me',
            onPressed: () => tapped = true,
          ),
        ),
      );

      await tester.tap(find.text('Tap me'));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('text style includes underline decoration', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          YgbV0AppLink(
            type: LinkStyleVariant.primary,
            text: 'Underlined',
            onPressed: () {},
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Underlined'));
      expect(text.style?.decoration, equals(TextDecoration.underline));
    });

    testWidgets('isUnderlined false removes underline decoration', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          YgbV0AppLink(
            type: LinkStyleVariant.primary,
            text: 'No underline',
            isUnderlined: false,
            onPressed: () {},
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('No underline'));
      expect(text.style?.decoration, equals(TextDecoration.none));
    });
  });
}
