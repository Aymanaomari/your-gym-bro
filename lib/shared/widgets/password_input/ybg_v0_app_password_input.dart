import 'package:flutter/material.dart';
import 'package:your_gym_bro/theme/ygb_v0_theme/ygb_v0_theme.dart';

class YbgV0AppPasswordInput extends StatefulWidget {
  const YbgV0AppPasswordInput({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.isError = false,
    required this.controller,
  });

  final String? hintText;
  final IconData? prefixIcon;
  final bool? isError;
  final TextEditingController controller;

  @override
  State<YbgV0AppPasswordInput> createState() => _YbgV0AppPasswordInputState();
}

class _YbgV0AppPasswordInputState extends State<YbgV0AppPasswordInput> {
  late final FocusNode _focusNode;
  bool _obscureText = true;

  void _handleControllerChange() => setState(() {});
  void _handleFocusChange() => setState(() {});

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_handleFocusChange);
    widget.controller.addListener(_handleControllerChange);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleControllerChange);
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hintColor = theme.ygbColors.primary50.withAlpha(100);
    final isError = widget.isError ?? false;
    final isFocused = _focusNode.hasFocus;
    final iconColor = isError
        ? theme.ygbColors.error
        : isFocused
        ? theme.ygbColors.primary500
        : theme.ygbColors.primary50;
    final Widget? leadingIcon = widget.prefixIcon == null
        ? null
        : Padding(
            padding: EdgeInsets.only(
              right: theme.ygbSpacing.xs,
              bottom: theme.ygbSpacing.xs,
            ),
            child: Icon(widget.prefixIcon, color: iconColor, size: 24),
          );

    return TextField(
      focusNode: _focusNode,
      obscureText: _obscureText,
      style: TextStyle(color: theme.ygbColors.primary50),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: theme.ygbSpacing.sm,
          horizontal: theme.ygbSpacing.sm,
        ),
        prefixIcon: leadingIcon,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              // Toggle the obscureText property
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: iconColor,
            size: 24,
          ),
        ),

        prefixIconConstraints: BoxConstraints(
          minHeight: theme.ygbSpacing.lg,
          minWidth: theme.ygbSpacing.lg,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: hintColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(theme.ygbSpacing.sm),
          borderSide: BorderSide.none,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isError
                ? theme.ygbColors.error
                : theme.ygbColors.primary50.withAlpha(100),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isError ? theme.ygbColors.error : theme.ygbColors.primary500,
            width: 2,
          ),
        ),
        focusColor: theme.ygbColors.primary500,
      ),
    );
  }
}
