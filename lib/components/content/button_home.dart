// ignore_for_file: must_be_immutable

import 'package:travel/resource/constant.dart';
import 'package:travel/resource/typo.dart';
import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget {
  ButtonHome({
    Key? key,
    required this.text,
    this.colorButton,
    required this.image,
    this.onTap,
  }) : super(key: key);
  final Color? colorButton;

  final String text;
  final String image;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onTap,
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Constants.bigBorderRadius),
              color: colorButton,
            ),
            child: Image.asset(
              image,
              width: 30,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: tStyle.HS14Medium(),
        ),
      ],
    );
  }
}
