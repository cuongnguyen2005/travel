// ignore_for_file: must_be_immutable

import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/typo.dart';
import 'package:flutter/material.dart';

class ContentBox extends StatelessWidget {
  ContentBox({
    Key? key,
    required this.icon,
    required this.color,
    required this.title,
    required this.content,
    this.onTap,
  }) : super(key: key);
  final IconData icon;
  final Color color;
  final String title;
  final String content;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Constants.mediumPadding),
        margin: EdgeInsets.only(bottom: Constants.smallPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.mediumBorderRadius),
          color: AppColor.white,
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Icon(
                icon,
                color: color,
              ),
            ),
            SizedBox(width: Constants.smallPadding),
            Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: tStyle.HS12LB(),
                  ),
                  Text(
                    content,
                    style: tStyle.HS14Bold(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
