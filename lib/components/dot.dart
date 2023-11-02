// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    Key? key,
    required this.length,
    required this.curIndex,
    this.margin,
    required this.mainAxisAlignment,
  }) : super(key: key);
  final int length;
  final int curIndex;
  final EdgeInsetsGeometry? margin;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: List.generate(
          length,
          (index) => Container(
            height: Constants.smallestPadding,
            width: curIndex == index
                ? Constants.bigPadding
                : Constants.smallestPadding,
            margin: EdgeInsets.symmetric(horizontal: Constants.smallestPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: curIndex == index ? AppColor.orange : AppColor.grey,
            ),
          ),
        ),
      ),
    );
  }
}
