// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:travel/resource/color.dart';
import 'package:flutter/material.dart';

const tStyle = TextStyle();

extension TextStyle$ on TextStyle {
  TextStyle H64() => copyWith(
        color: AppColor.white,
        fontFamily: 'Roboto',
        fontSize: 64,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        height: 1.05,
      );
  TextStyle HS30() => copyWith(
        color: AppColor.white,
        fontFamily: 'Roboto',
        fontSize: 30,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      );
  TextStyle HS24() => copyWith(
        color: AppColor.black,
        fontFamily: 'Roboto',
        fontSize: 24,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      );
  TextStyle HS24LB() => copyWith(
        color: AppColor.lightblack,
        fontFamily: 'Roboto',
        fontSize: 24,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      );
  TextStyle HS20() => copyWith(
        color: AppColor.lightblack,
        fontFamily: 'Roboto',
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      );
  TextStyle HS18() => copyWith(
        color: AppColor.lightblack,
        fontFamily: 'Roboto',
        fontSize: 18,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      );
  TextStyle HS18W() => copyWith(
        color: AppColor.white,
        fontFamily: 'Roboto',
        fontSize: 18,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      );
  TextStyle HS16MediumLB() => copyWith(
        color: AppColor.lightblack,
        fontFamily: 'Roboto',
        fontSize: 16,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
      );
  TextStyle HS16Bold() => copyWith(
        color: AppColor.lightblack,
        fontFamily: 'Roboto',
        fontSize: 16,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      );
  TextStyle HS16WBold() => copyWith(
        color: AppColor.white,
        fontFamily: 'Roboto',
        fontSize: 16,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      );
  TextStyle HS16W() => copyWith(
        color: AppColor.white,
        fontFamily: 'Roboto',
        fontSize: 16,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      );
  TextStyle HS14Bold() => copyWith(
        color: AppColor.lightblack,
        fontFamily: 'Roboto',
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 1.6,
      );
  TextStyle HS14BoldW() => copyWith(
        color: AppColor.white,
        fontFamily: 'Roboto',
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 1.6,
      );
  TextStyle HS14BoldPurple() => copyWith(
        color: AppColor.themeColor,
        fontFamily: 'Roboto',
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 1.6,
      );
  TextStyle HS14Medium() => copyWith(
        color: AppColor.lightblack,
        fontFamily: 'Roboto',
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 1.6,
      );
  TextStyle HS12W() => copyWith(
        color: AppColor.white,
        fontFamily: 'Roboto',
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
      );
  TextStyle HS12LB() => copyWith(
        color: AppColor.lightblack,
        fontFamily: 'Roboto',
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
      );
}
