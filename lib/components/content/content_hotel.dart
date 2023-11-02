// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/typo.dart';
import 'package:travel/resource/utils/fomart.dart';

import '../btns/button_primary.dart';

class ContentHotelView extends StatelessWidget {
  const ContentHotelView({
    Key? key,
    required this.image,
    required this.name,
    required this.location,
    this.rating,
    required this.price,
    this.onTap,
    this.isCheckNameButton = false,
    required this.isCheckButton,
  }) : super(key: key);

  final String image;
  final String name;
  final String location;
  final String? rating;
  final int price;
  final void Function()? onTap;
  final bool? isCheckNameButton;
  final bool isCheckButton;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: Constants.bigPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Constants.bigBorderRadius),
        color: AppColor.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Constants.bigBorderRadius),
              bottomRight: Radius.circular(Constants.bigBorderRadius),
            ),
            child: Image.asset(
              image,
              height: 160,
              width: size.width * .8,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.all(Constants.smallPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: tStyle.HS20(),
                ),
                SizedBox(height: Constants.smallestPadding),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 20,
                      color: AppColor.pink,
                    ),
                    Expanded(
                      child: Text(
                        location,
                        overflow: TextOverflow.ellipsis,
                        style: tStyle.HS12LB(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Constants.smallestPadding),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 0.5, color: AppColor.grey))),
                  child: isCheckButton == false
                      ? Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 20,
                              color: AppColor.yellow,
                            ),
                            Text(
                              '$rating / 5',
                              style: tStyle.HS14Medium(),
                            ),
                          ],
                        )
                      : Container(),
                ),
                SizedBox(height: Constants.smallPadding),
                isCheckButton == false
                    ? Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${FomartUtils.formatMoney(price)} VND',
                                  style: tStyle.HS24(),
                                ),
                                Text(
                                  '/đêm',
                                  style: tStyle.HS12LB(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: ButtonPrimary(
                              nameButton: isCheckNameButton == true
                                  ? 'Chi tiết'
                                  : 'Bỏ thích',
                              onTap: onTap,
                            ),
                          ),
                        ],
                      )
                    : ButtonPrimary(
                        nameButton: 'Thông tin',
                        onTap: onTap,
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
