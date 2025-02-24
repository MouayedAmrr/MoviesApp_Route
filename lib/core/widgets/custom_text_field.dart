import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/color_palette.dart';
class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPassword;
  final String? hint;
  final String? label;
  final bool? enabled;
  final bool? isReadOnly; // New parameter to control editability
  final TextStyle? textStyle;
  final int? maxLines, minLines, maxLength;
  final String? obscuringCharacter, value;
  final String? Function(String?)? onValidate;
  final void Function(String?)? onChanged, onFieldSubmitted, onSaved;
  final void Function()? onEditingComplete, onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixWidget, prefixIcon;
  final IconData? icon;
  final TextInputAction? action;
  final FocusNode? focusNode;
  final Color? hintColor;
  final Color? fillColor;
  final Color? iconColor;
  final TextDirection? textDirection;
  final EdgeInsets? edgeInsets;
  final Color? borderColor;

  const CustomTextField({
    super.key,
    this.controller,
    this.isPassword,
    this.hint,
    this.textStyle,
    this.label,
    this.enabled,
    this.isReadOnly = false, // Default: Not read-only
    this.obscuringCharacter,
    this.value,
    this.onValidate,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onSaved,
    this.onTap,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.suffixWidget,
    this.icon,
    this.prefixIcon,
    this.action,
    this.focusNode,
    this.textDirection,
    this.fillColor = Colors.white,
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.borderColor,
    this.edgeInsets = const EdgeInsets.only(top: 14, left: 16, right: 16, bottom: 14),
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    Color borderClr = widget.borderColor ?? widget.fillColor ?? Colors.transparent;

    return TextFormField(
      readOnly: widget.isReadOnly ?? false, // Control edit ability
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textDirection: widget.textDirection,
      controller: widget.controller,
      textAlignVertical: TextAlignVertical.center,
      initialValue: widget.value,
      validator: widget.onValidate,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      obscureText: widget.isPassword ?? false ? obscureText : false,
      obscuringCharacter: '*',
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      style: widget.textStyle ?? const TextStyle(color: Colors.white),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: widget.action ?? TextInputAction.done,
      focusNode: widget.focusNode,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        prefixIconConstraints: const BoxConstraints(minWidth: 56),
        suffixIcon: widget.isPassword ?? false
            ? InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            color: widget.iconColor,
          ),
        )
            : widget.suffixWidget,
        prefixIcon: widget.prefixIcon != null
            ? IconTheme(
          data: IconThemeData(color: widget.iconColor),
          child: widget.prefixIcon!,
        )
            : null,
        hintText: widget.hint,
        hintStyle: TextStyle(color: widget.hintColor),
        fillColor: widget.fillColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderClr, width: 1),
        ),
        contentPadding: widget.edgeInsets,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderClr, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderClr, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorPalette.Textformfireldbg, width: 2),
        ),
        errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
  }
}
