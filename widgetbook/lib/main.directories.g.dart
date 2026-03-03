// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _widgetbook;
import 'package:widgetbook_workspace/ygb_v0/ygb_v0_app_button.dart'
    as _widgetbook_workspace_ygb_v0_ygb_v0_app_button;
import 'package:widgetbook_workspace/ygb_v0/ygb_v0_app_text_input.dart'
    as _widgetbook_workspace_ygb_v0_ygb_v0_app_text_input;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'shared',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'widgets',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'button',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'YgbV0AppButton',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'App Button',
                    builder: _widgetbook_workspace_ygb_v0_ygb_v0_app_button
                        .buildYgbV0AppButton,
                  ),
                ],
              ),
              _widgetbook.WidgetbookComponent(
                name: 'YgbV0AppTextInput',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'App Text Input',
                    builder: _widgetbook_workspace_ygb_v0_ygb_v0_app_text_input
                        .buildYgbV0AppTextInput,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
