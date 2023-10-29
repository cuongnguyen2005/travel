// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/typo.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  TextForm({
    super.key,
    this.text,
    required this.controller,
    this.validator,
    this.autovalidateMode,
    required this.autofocus,
    this.initialValue,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
  });

  final text;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  bool autofocus;
  final String? initialValue;
  final TextInputType? keyboardType;
  Widget? suffixIcon;
  Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      initialValue: initialValue,
      autofocus: autofocus,
      autovalidateMode: autovalidateMode,
      validator: validator,
      controller: controller,
      style: tStyle.HS14Medium(),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: white,
        contentPadding: EdgeInsets.all(mediumPadding),
        labelText: text,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
