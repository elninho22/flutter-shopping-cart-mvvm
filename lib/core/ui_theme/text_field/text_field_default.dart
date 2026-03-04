import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../exports.dart';

class TextFieldDefault extends StatelessWidget {
  final String? label;
  final FocusNode? focusNode;
  final String? hint;
  final Widget? trailingIcon;
  final Widget? leadIcon;
  final bool enabled;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final int? errorMaxLines;
  final bool? showMaxLength;
  final bool readOnly;
  final Function()? callbackOnTap;
  final String? helper;
  final bool autofocus;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool filled;
  final InputBorder? border;
  final TextInputAction textInputAction;
  final bool hasFocus;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;
  final TextCapitalization textCapitalization;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final Color? fillColor;
  final AutovalidateMode? autovalidateMode;
  final void Function(String?)? onSaved;
  final Iterable<String>? autofillHints;
  final void Function(PointerDownEvent)? onTapOutside;
  const TextFieldDefault({
    super.key,
    this.label,
    this.focusNode,
    this.hint,
    this.trailingIcon,
    this.leadIcon,
    this.enabled = true,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.errorMaxLines = 1,
    this.showMaxLength,
    this.readOnly = false,
    this.callbackOnTap,
    this.helper,
    this.autofocus = false,
    this.onChanged,
    this.onFieldSubmitted,
    this.filled = true,
    this.border,
    this.textInputAction = TextInputAction.next,
    this.hasFocus = false,
    this.validator,
    this.onEditingComplete,
    this.textCapitalization = TextCapitalization.none,
    this.enabledBorder,
    this.disabledBorder,
    this.fillColor,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onSaved,
    this.autofillHints,
    this.onTapOutside,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
      key: key,
      onTapOutside: onTapOutside,
      autofillHints: autofillHints,
      autovalidateMode: autovalidateMode,
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      enabled: enabled,
      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      cursorColor: UiThemeColors.neutral80,
      style: UiTextStyles.body14(
        color: enabled ? UiThemeColors.neutral90 : UiThemeColors.neutral50.withValues(alpha: 0.5),
      ),
      decoration: InputDecoration(
        hoverColor: Colors.transparent,
        focusedBorder: border ?? _borderStyle(withBorder: true),
        enabledBorder: enabledBorder,
        disabledBorder: disabledBorder,
        border: border,
        contentPadding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal:16,
        ),
        counterText: showMaxLength == true ? null : '',
        suffixIcon: trailingIcon,
        prefixIcon: leadIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(top: 16),
                child: leadIcon,
              ),
        filled: filled,
        fillColor: fillColor ?? (enabled ? Colors.transparent : UiThemeColors.neutral70.withValues(alpha: 0.04)),
        labelText: label,
        labelStyle: UiTextStyles.body12(color: UiThemeColors.neutral70),
        
        hintText: hint,
        hintStyle: UiTextStyles.body12( color: UiThemeColors.neutral60),
        alignLabelWithHint: true,
        errorStyle: UiTextStyles.body12(color: UiThemeColors.error),
        helperText: helper,
        helperStyle:  UiTextStyles.body12(),
        errorMaxLines: errorMaxLines,
      ),
      validator: validator,
      onChanged: onChanged,
      onTap: callbackOnTap,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onSaved: onSaved,
    );

  InputBorder _borderStyle({bool isError = false, bool isFocused = false, required bool withBorder}) => UnderlineInputBorder(
      borderSide: withBorder
          ? BorderSide(
              width: isFocused ? 2 : 2,
              color: isError
                  ? UiThemeColors.error
                  : isFocused
                  ? UiThemeColors.neutral60
                  : UiThemeColors.neutral90,
            )
          : BorderSide.none,
    );
}
