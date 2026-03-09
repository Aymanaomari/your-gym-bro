import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_gym_bro/shared/widgets/password_input/ybg_v0_app_password_input.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_theme.dart';

void main() {
  final theme = YGBV0ThemeLight().themeData;

  testWidgets('text is obscured by default', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _wrapWithTheme(
        theme,
        YbgV0AppPasswordInput(
          hintText: 'Password',
          prefixIcon: Icons.lock,
          controller: controller,
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.obscureText, isTrue);
  });

  testWidgets('tapping visibility icon toggles obscure text', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _wrapWithTheme(
        theme,
        YbgV0AppPasswordInput(
          hintText: 'Password',
          prefixIcon: Icons.lock,
          controller: controller,
        ),
      ),
    );

    // Initially shows visibility icon (text is obscured)
    expect(find.byIcon(Icons.visibility), findsOneWidget);
    expect(find.byIcon(Icons.visibility_off), findsNothing);

    // Tap the visibility toggle
    await tester.tap(find.byIcon(Icons.visibility));
    await tester.pumpAndSettle();

    // Now shows visibility_off icon (text is visible)
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    expect(find.byIcon(Icons.visibility), findsNothing);

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.obscureText, isFalse);

    // Tap again to re-obscure
    await tester.tap(find.byIcon(Icons.visibility_off));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.visibility), findsOneWidget);
    final textFieldAgain = tester.widget<TextField>(find.byType(TextField));
    expect(textFieldAgain.obscureText, isTrue);
  });

  testWidgets('prefix icon color reacts to focus changes', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _wrapWithTheme(
        theme,
        YbgV0AppPasswordInput(
          hintText: 'Password',
          prefixIcon: Icons.lock,
          controller: controller,
        ),
      ),
    );

    Icon idleIcon = tester.widget(find.byIcon(Icons.lock));
    expect(idleIcon.color, equals(theme.ygbColors.primary50));

    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    Icon focusedIcon = tester.widget(find.byIcon(Icons.lock));
    expect(focusedIcon.color, equals(theme.ygbColors.primary500));
  });

  testWidgets('suffix icon color reacts to focus changes', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _wrapWithTheme(
        theme,
        YbgV0AppPasswordInput(hintText: 'Password', controller: controller),
      ),
    );

    Icon idleIcon = tester.widget(find.byIcon(Icons.visibility));
    expect(idleIcon.color, equals(theme.ygbColors.primary50));

    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    Icon focusedIcon = tester.widget(find.byIcon(Icons.visibility));
    expect(focusedIcon.color, equals(theme.ygbColors.primary500));
  });

  testWidgets('error state overrides focus styling', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _wrapWithTheme(
        theme,
        YbgV0AppPasswordInput(
          hintText: 'Password',
          prefixIcon: Icons.lock,
          controller: controller,
          isError: true,
        ),
      ),
    );

    final prefixIcon = tester.widget<Icon>(find.byIcon(Icons.lock));
    expect(prefixIcon.color, equals(theme.ygbColors.error));

    final suffixIcon = tester.widget<Icon>(find.byIcon(Icons.visibility));
    expect(suffixIcon.color, equals(theme.ygbColors.error));

    final textField = tester.widget<TextField>(find.byType(TextField));
    final enabledBorder =
        textField.decoration?.enabledBorder as UnderlineInputBorder?;
    final focusedBorder =
        textField.decoration?.focusedBorder as UnderlineInputBorder?;

    expect(enabledBorder?.borderSide.color, equals(theme.ygbColors.error));
    expect(focusedBorder?.borderSide.color, equals(theme.ygbColors.error));
  });

  testWidgets('error state persists after focus', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _wrapWithTheme(
        theme,
        YbgV0AppPasswordInput(
          hintText: 'Password',
          prefixIcon: Icons.lock,
          controller: controller,
          isError: true,
        ),
      ),
    );

    // Focus the field
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    // Icons should still be error color even when focused
    final prefixIcon = tester.widget<Icon>(find.byIcon(Icons.lock));
    expect(prefixIcon.color, equals(theme.ygbColors.error));

    final suffixIcon = tester.widget<Icon>(find.byIcon(Icons.visibility));
    expect(suffixIcon.color, equals(theme.ygbColors.error));
  });

  testWidgets('renders without prefix icon', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _wrapWithTheme(
        theme,
        YbgV0AppPasswordInput(hintText: 'Password', controller: controller),
      ),
    );

    // Only the visibility suffix icon should be present
    expect(find.byIcon(Icons.visibility), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('displays hint text', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _wrapWithTheme(
        theme,
        YbgV0AppPasswordInput(
          hintText: 'Enter your password',
          controller: controller,
        ),
      ),
    );

    expect(find.text('Enter your password'), findsOneWidget);
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
