// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/components/content/content_box.dart';
import 'package:travel/components/dialog/dialog.dart';
import 'package:travel/features/book_hotel/checkout_hotel.dart';
import 'package:travel/components/appbar.dart';
import 'package:travel/components/content/content_appbar_1.dart';
import 'package:travel/components/content/convenient.dart';
import 'package:travel/components/content/select_passenger_widget.dart';

import 'package:travel/models/hotels.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/typo.dart';
import 'package:travel/resource/utils/fomart.dart';

class BookHotelArg {
  final Hotels hotels;

  final String uid;
  BookHotelArg({
    required this.hotels,
    required this.uid,
  });
}

class BookHotel extends StatefulWidget {
  const BookHotel({super.key, required this.arg});
  final BookHotelArg arg;
  static String routeName = 'book_hotel';

  @override
  State<BookHotel> createState() => _BookHotelState();
}

class _BookHotelState extends State<BookHotel> {
  int passenger = 1;
  DateTime selectedDateTo = DateTime.now();
  DateTime selectedDateFrom = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppBarWidget(),
          ContentAppBar1(
            isFull: true,
            title: 'Đặt phòng',
            onTap: onTapBack,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Constants.bigPadding),
            child: Column(
              children: [
                const SizedBox(height: 200),
                //
                Flexible(
                  child: ListView(
                    padding: EdgeInsets.only(top: Constants.smallPadding),
                    children: [
                      Container(
                        padding: EdgeInsets.all(Constants.mediumPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              Constants.mediumBorderRadius),
                          color: AppColor.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    widget.arg.hotels.nameHotel,
                                    style: tStyle.HS20(),
                                  ),
                                ),
                                SizedBox(width: Constants.smallPadding),
                                Expanded(
                                  flex: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        Constants.smallBorderRadius),
                                    child: Image.asset(
                                      widget.arg.hotels.image[0],
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Constants.smallPadding),
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: Constants.smallPadding),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: AppColor.grey,
                                  ),
                                ),
                              ),
                              child: const Convenient(),
                            ),
                            SizedBox(height: Constants.smallPadding),
                            Text(
                              '${FomartUtils.formatMoney(widget.arg.hotels.price)} VND',
                              style: tStyle.HS24(),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: Constants.bigPadding),
                      ContentBox(
                        icon: Icons.calendar_month,
                        color: AppColor.pink,
                        title: 'Từ ngày',
                        content: DateFormat.yMd().format(selectedDateFrom),
                        onTap: () async {
                          DateTime? chooseDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDateFrom,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050),
                          );
                          if (chooseDate != null) {
                            setState(() {
                              selectedDateFrom = chooseDate;
                            });
                          }
                        },
                      ),
                      ContentBox(
                        icon: Icons.calendar_month,
                        color: AppColor.pink,
                        title: 'Đến ngày',
                        content: DateFormat.yMd().format(selectedDateTo),
                        onTap: () async {
                          DateTime? chooseDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDateTo,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050),
                          );
                          if (chooseDate != null) {
                            setState(() {
                              selectedDateTo = chooseDate;
                            });
                          }
                        },
                      ),
                      SelectPassenger(
                        content: '$passenger người',
                        onTapDecrease: () {
                          setState(() {
                            passenger--;
                          });
                        },
                        onTapIncrease: () {
                          setState(() {
                            passenger++;
                          });
                        },
                      ),
                      const SizedBox(height: 90),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(Constants.bigPadding),
        child: ButtonPrimary(
          nameButton: 'Thanh Toán',
          onTap: onTapDone,
        ),
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapDone() {
    if (selectedDateFrom.isBefore(selectedDateTo)) {
      Navigator.pushNamed(
        context,
        CheckoutHotels.routeName,
        arguments: CheckoutHotelsArg(
          hotels: widget.arg.hotels,
          dateTo: selectedDateTo,
          dateFrom: selectedDateFrom,
          uid: widget.arg.uid,
          passenger: passenger,
        ),
      );
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return DialogPrimary(
              title: 'Ngày đến không hợp lệ',
              onTap: onTapBack,
            );
          });
    }
  }
}
