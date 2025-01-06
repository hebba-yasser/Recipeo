import 'package:flutter/material.dart';
import 'package:recpie_app/constants.dart';

import '../../styles/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.keyboardText,
      this.obscureText = false,
      this.controller,
      this.validator,
      this.onSaved,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixOnPressed,
      this.prefixIconColor,
      this.hintStyle,
      this.onFieldSubmitted,
      this.focusNode,
      this.autofocus = false,
      this.onChanged,
      this.suffixIconColor,
      this.minWidthPrefixIcon,
      this.onTap,
      this.readOnly = false,
      this.fillColor});

  final String? hintText;
  final TextInputType? keyboardText;
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final TextStyle? hintStyle;
  final IconData? suffixIcon;
  final void Function()? suffixOnPressed;
  final FormFieldSetter<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onChanged;
  final void Function()? onTap;

  final double? minWidthPrefixIcon;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool readOnly;
  final Color? fillColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: fillColor ?? AppColors.cream,
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kprimaryColor),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: minWidthPrefixIcon ?? 48, // Adjust as necessary
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: prefixIconColor,
        ),
        suffixIcon: IconButton(
            onPressed: suffixOnPressed,
            icon: Icon(
              suffixIcon,
              color: suffixIconColor,
            )),
        hintText: hintText,
        hintStyle: hintStyle,
      ),
      keyboardType: keyboardText,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      focusNode: focusNode,
      autofocus: autofocus,
    );
  }
}
