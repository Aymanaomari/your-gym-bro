import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_gym_bro/shared/widgets/text_input/ygb_v0_app_text_input.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_theme.dart';

void main() {
  final theme = YGBV0ThemeLight().themeData;

  testWidgets('prefix icon color reacts to focus changes', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _wrapWithTheme(
        theme,
        YGBV0AppTextInput(
          hintText: 'Email',
          prefixIcon: Icons.email,
          controller: controller,
        ),
      ),
    );

    Icon idleIcon = tester.widget(find.byIcon(Icons.email));
    expect(idleIcon.color, equals(theme.ygbColors.primary50));

    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    Icon focusedIcon = tester.widget(find.byIcon(Icons.email));
    expect(focusedIcon.color, equals(theme.ygbColors.primary500));
  });

  testWidgets('error state overrides focus styling', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _wrapWithTheme(
        theme,
        YGBV0AppTextInput(
          hintText: 'Email',
          prefixIcon: Icons.lock,
          controller: controller,
          isError: true,
        ),
      ),
    );

    final icon = tester.widget<Icon>(find.byIcon(Icons.lock));
    expect(icon.color, equals(theme.ygbColors.error));

    final textField = tester.widget<TextField>(find.byType(TextField));
    final enabledBorder =
        textField.decoration?.enabledBorder as UnderlineInputBorder?;
    final focusedBorder =
        textField.decoration?.focusedBorder as UnderlineInputBorder?;

    expect(enabledBorder?.borderSide.color, equals(theme.ygbColors.error));
    expect(focusedBorder?.borderSide.color, equals(theme.ygbColors.error));
  });

  testWidgets('onchange callback is invoked when text changes', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    String? capturedValue;

    await tester.pumpWidget(
      _wrapWithTheme(
        theme,
        YGBV0AppTextInput(
          hintText: 'Email',
          controller: controller,
          onchange: (value) => capturedValue = value,
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'hello@example.com');
    expect(capturedValue, equals('hello@example.com'));
  });

  testWidgets('onchange is not required and defaults to null', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _wrapWithTheme(
        theme,
        YGBV0AppTextInput(
          hintText: 'Email',
          controller: controller,
        ),
      ),
    );

    // Entering text must not throw when onchange is null
    await tester.enterText(find.byType(TextField), 'abc');
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsOneWidget);
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
