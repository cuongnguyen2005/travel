// ignore_for_file: must_be_immutable

import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/typo.dart';
import 'package:flutter/material.dart';

class SelectPassenger extends StatelessWidget {
  SelectPassenger({
    Key? key,
    required this.content,
    this.onTapDecrease,
    this.onTapIncrease,
  }) : super(key: key);

  final String content;
  void Function()? onTapDecrease;
  void Function()? onTapIncrease;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Constants.mediumPadding),
      margin: EdgeInsets.only(bottom: Constants.smallPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Constants.mediumBorderRadius),
        color: AppColor.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              Icons.person,
              color: AppColor.orange,
            ),
          ),
          SizedBox(width: Constants.smallPadding),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Người',
                      style: tStyle.HS12LB(),
                    ),
                    Text(
                      content,
                      style: tStyle.HS14Bold(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: onTapDecrease,
                      icon: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColor.green,
                        child: Text(
                          '-',
                          style: TextStyle(color: AppColor.white, fontSize: 24),
                        ),
                      ),
                    ),
                    SizedBox(width: Constants.smallestPadding),
                    IconButton(
                      onPressed: onTapIncrease,
                      icon: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColor.green,
                        child: Icon(
                          Icons.add,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
