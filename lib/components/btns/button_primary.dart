// ignore_for_file: must_be_immutable

import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/typo.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  ButtonPrimary({
    Key? key,
    required this.nameButton,
    this.onTap,
  }) : super(key: key);

  void Function()? onTap;
  final String nameButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: Constants.mediumPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.bigBorderRadius),
          color: AppColor.themeColor,
        ),
        child: Text(
          nameButton,
          textAlign: TextAlign.center,
          style: tStyle.HS16W(),
        ),
      ),
    );
  }
}
