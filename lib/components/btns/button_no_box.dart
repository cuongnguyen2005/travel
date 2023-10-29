// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ButtonNoBox extends StatelessWidget {
  ButtonNoBox({Key? key, required this.nameButton, this.onTap, this.style})
      : super(key: key);

  final String nameButton;
  void Function()? onTap;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        nameButton,
        style: style,
      ),
    );
  }
}
