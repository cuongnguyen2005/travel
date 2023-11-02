// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:travel/resource/color.dart';
import 'package:travel/resource/typo.dart';
import 'package:flutter/material.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({
    super.key,
    this.text,
    required this.controller,
    this.onTapHidePw,
    required this.obscureText,
    this.validator,
    this.autovalidateMode,
    this.initialValue,
  });

  final text;
  final bool obscureText;
  final TextEditingController controller;
  final void Function()? onTapHidePw;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      validator: validator,
      autovalidateMode: autovalidateMode,
      obscureText: obscureText,
      controller: controller,
      style: tStyle.HS14Medium(),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.white,
        suffixIcon: InkWell(
          onTap: onTapHidePw,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              obscureText
                  ? 'assets/images/hidepw.png'
                  : 'assets/images/pwicon.png',
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
          ),
        ),
        contentPadding: EdgeInsets.all(16),
        hintText: text,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0.1, color: AppColor.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
