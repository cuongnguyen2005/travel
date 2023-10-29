// ignore_for_file: must_be_immutable

import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/typo.dart';
import 'package:flutter/material.dart';

class ContentAppBar1 extends StatelessWidget {
  ContentAppBar1({
    Key? key,
    this.title,
    this.text,
    this.onTap,
    required this.isFull,
  }) : super(key: key);

  final String? title;
  final String? text;
  void Function()? onTap;
  final bool isFull;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isFull != true
            ? Container(
                padding: EdgeInsets.only(top: 60, left: bigPadding),
                child: Row(
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(bigBorderRadius),
                          color: white,
                        ),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    SizedBox(width: bigPadding),
                    Text(
                      title ?? '',
                      style: tStyle.HS30(),
                    ),
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.only(
                    top: 60, left: bigPadding, right: bigPadding),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: onTap,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(bigBorderRadius),
                            color: white,
                          ),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        title ?? '',
                        style: tStyle.HS30(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        text ?? '',
                        style: tStyle.HS12W(),
                      ),
                    ),
                  ],
                ),
              )
      ],
    );
  }
}
