import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_gym_bro/shared/widgets/link/ygb_v0_app_link.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_theme.dart';

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
            type: ButtonStyleVariant.primary,
            text: 'Sign up',
            onPressed: () {},
          ),
        ),
      );

      expect(find.text('Sign up'), findsOneWidget);
    });

    testWidgets('primary variant uses primary500 foreground color', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          YgbV0AppLink(
            type: ButtonStyleVariant.primary,
            text: 'Link',
            onPressed: () {},
          ),
        ),
      );

      final button = tester.widget<TextButton>(find.byType(TextButton));
      final foreground = button.style?.foregroundColor?.resolve({});

      expect(foreground, equals(theme.ygbColors.primary500));
    });

    testWidgets('secondary variant uses primary50 foreground color', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          YgbV0AppLink(
            type: ButtonStyleVariant.secondary,
            text: 'Link',
            onPressed: () {},
          ),
        ),
      );

      final button = tester.widget<TextButton>(find.byType(TextButton));
      final foreground = button.style?.foregroundColor?.resolve({});

      expect(foreground, equals(theme.ygbColors.primary50));
    });

    testWidgets('danger variant uses error foreground color', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          YgbV0AppLink(
            type: ButtonStyleVariant.danger,
            text: 'Delete',
            onPressed: () {},
          ),
        ),
      );

      final button = tester.widget<TextButton>(find.byType(TextButton));
      final foreground = button.style?.foregroundColor?.resolve({});

      expect(foreground, equals(theme.ygbColors.error));
    });

    testWidgets(
      'disabled state resolves to faded color when onPressed is null',
      (tester) async {
        await tester.pumpWidget(
          _wrapWithTheme(
            theme,
            const YgbV0AppLink(
              type: ButtonStyleVariant.primary,
              text: 'Disabled',
            ),
          ),
        );

        final button = tester.widget<TextButton>(find.byType(TextButton));
        final disabledColor = button.style?.foregroundColor?.resolve({
          WidgetState.disabled,
        });

        expect(
          disabledColor,
          equals(theme.ygbColors.primary500.withAlpha(100)),
        );
      },
    );

    testWidgets('pressed state resolves to dimmed color', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          YgbV0AppLink(
            type: ButtonStyleVariant.primary,
            text: 'Press me',
            onPressed: () {},
          ),
        ),
      );

      final button = tester.widget<TextButton>(find.byType(TextButton));
      final pressedColor = button.style?.foregroundColor?.resolve({
        WidgetState.pressed,
      });

      expect(pressedColor, equals(theme.ygbColors.primary500.withAlpha(180)));
    });

    testWidgets('hovered state resolves to slightly faded color', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          YgbV0AppLink(
            type: ButtonStyleVariant.primary,
            text: 'Hover me',
            onPressed: () {},
          ),
        ),
      );

      final button = tester.widget<TextButton>(find.byType(TextButton));
      final hoveredColor = button.style?.foregroundColor?.resolve({
        WidgetState.hovered,
      });

      expect(hoveredColor, equals(theme.ygbColors.primary500.withAlpha(200)));
    });

    testWidgets('onPressed callback is invoked on tap', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        _wrapWithTheme(
          theme,
          YgbV0AppLink(
            type: ButtonStyleVariant.primary,
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
            type: ButtonStyleVariant.primary,
            text: 'Underlined',
            onPressed: () {},
          ),
        ),
      );

      final button = tester.widget<TextButton>(find.byType(TextButton));
      final textStyle = button.style?.textStyle?.resolve({});

      expect(textStyle?.decoration, equals(TextDecoration.underline));
    });
  });
}
