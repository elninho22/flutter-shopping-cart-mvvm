import 'package:flutter/material.dart';

import '../core_exports.dart';

// ignore: must_be_immutable
class UiButton extends StatelessWidget {
  final String label;
  final bool enable;
  final bool expanded;
  final bool underline;
  final IconData? leadIcon;
  final IconData? trailingIcon;
  final Color? backgroundColor;
  Color? textColor;
  final void Function() onPressed;
  late final ButtonStyle style;

  UiButton.filled({
    super.key,
    this.enable = true,
    this.underline = false,
    this.expanded = false,
    this.leadIcon,
    this.trailingIcon,
    this.textColor,
    this.backgroundColor,
    required this.label,
    required this.onPressed,
  }) {
    textColor = textColor ?? UiThemeColors.white;
    style = FilledButton.styleFrom(
      backgroundColor: backgroundColor ?? UiThemeColors.primary,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  UiButton.secondary({
    super.key,
    this.enable = true,
    this.underline = false,
    this.expanded = false,
    this.leadIcon,
    this.trailingIcon,
    this.textColor,
    this.backgroundColor,
    required this.label,
    required this.onPressed,
  }) {
    textColor = UiThemeColors.white;
    style = FilledButton.styleFrom(
      backgroundColor: UiThemeColors.darkColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: enable ? onPressed : null,
    style: style,
    child: Row(
      mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leadIcon != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              size: 18,
              leadIcon,
              color: enable ? textColor ?? UiThemeColors.primary : UiThemeColors.neutral40,
            ),
          ),
        Text(
          label,
          style: UiTextStyles.body14(
            color: enable ? textColor ?? UiThemeColors.primary : UiThemeColors.neutral40,
          ),
        ),
        if (trailingIcon != null)
          Padding(
            padding:const EdgeInsets.only(left: 8),
            child: Icon(
              trailingIcon,
              size: 18,
              color: enable ? textColor ?? UiThemeColors.primary : UiThemeColors.neutral40,
            ),
          ),
      ],
    ),
  );
}
