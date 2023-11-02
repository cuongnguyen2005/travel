import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColor.themeColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Constants.bigBorderRadius),
        ),
      ),
    );
  }
}
