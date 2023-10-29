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
      padding: EdgeInsets.all(mediumPadding),
      margin: EdgeInsets.only(bottom: smallPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(mediumBorderRadius),
        color: white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              Icons.person,
              color: orange,
            ),
          ),
          SizedBox(width: smallPadding),
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
                        backgroundColor: green,
                        child: Icon(
                          Icons.add,
                          color: white,
                        ),
                      ),
                    ),
                    SizedBox(width: smallestPadding),
                    IconButton(
                      onPressed: onTapIncrease,
                      icon: CircleAvatar(
                        radius: 20,
                        backgroundColor: green,
                        child: Icon(
                          Icons.add,
                          color: white,
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
