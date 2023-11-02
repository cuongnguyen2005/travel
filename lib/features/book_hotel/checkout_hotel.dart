// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:travel/components/appbar.dart';
import 'package:travel/components/btns/button_no_box.dart';
import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/components/content/content_appbar_1.dart';
import 'package:travel/components/dialog/dialog.dart';
import 'package:travel/models/hotels.dart';
import 'package:travel/models/your_book.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/shared_preferences.dart';
import 'package:travel/resource/typo.dart';
import 'package:travel/resource/utils/fomart.dart';

class CheckoutHotelsArg {
  final Hotels hotels;
  final DateTime dateTo;
  final DateTime dateFrom;
  final String uid;
  final int passenger;
  CheckoutHotelsArg({
    required this.hotels,
    required this.dateTo,
    required this.dateFrom,
    required this.uid,
    required this.passenger,
  });
}

class CheckoutHotels extends StatefulWidget {
  const CheckoutHotels({super.key, required this.arg});
  final CheckoutHotelsArg arg;
  static String routeName = 'checkout_hotel';

  @override
  State<CheckoutHotels> createState() => _CheckoutHotelsState();
}

class _CheckoutHotelsState extends State<CheckoutHotels> {
  @override
  void initState() {
    getInfo();
    getPlaceBook();
    super.initState();
  }

  List<YourBooked> listYourBook = [];
  void getPlaceBook() async {
    listYourBook =
        await SharedPreferencesLocal.getPlacesBookUid(widget.arg.uid);
  }

  void addPlaces(YourBooked newPlace) {
    setState(() {
      listYourBook.add(newPlace);
    });
    SharedPreferencesLocal.saveYourPlaceBooked(listYourBook, widget.arg.uid);
  }

  int dayCheck = 1;

  void getInfo() {
    int dayCheckin = widget.arg.dateFrom.day;
    int dayCheckout = widget.arg.dateTo.day;
    if (dayCheckin == dayCheckout) {
      setState(() {
        dayCheck = 1;
      });
    } else if (dayCheckout > dayCheckin) {
      setState(() {
        dayCheck = dayCheckout - dayCheckin;
      });
    } else if (dayCheckout < dayCheckin) {
      setState(() {
        dayCheck = dayCheckin - dayCheckout;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppBarWidget(),
          ContentAppBar1(
            isFull: true,
            title: 'Checkout',
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
                    padding: EdgeInsets.only(top: Constants.bigPadding),
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
                            SizedBox(height: Constants.bigPadding),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/images/checkin.png'),
                                    SizedBox(width: Constants.smallPadding),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Nhận phòng',
                                            style: tStyle.HS12LB()),
                                        Text(
                                            DateFormat.MMMEd()
                                                .format(widget.arg.dateFrom),
                                            style: tStyle.HS14Bold()),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: Constants.bigPadding),
                                Row(
                                  children: [
                                    Image.asset('assets/images/checkout.png'),
                                    SizedBox(width: Constants.smallPadding),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Trả phòng',
                                            style: tStyle.HS12LB()),
                                        Text(
                                            DateFormat.MMMEd()
                                                .format(widget.arg.dateTo),
                                            style: tStyle.HS14Bold()),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Constants.bigPadding),
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
                                Text(
                                  '1 đêm',
                                  style: tStyle.HS12LB(),
                                ),
                                const Spacer(),
                                Text(
                                  '${FomartUtils.formatMoney(widget.arg.hotels.price)} VND',
                                  style: tStyle.HS12LB(),
                                ),
                              ],
                            ),
                            SizedBox(height: Constants.mediumPadding),
                            Row(
                              children: [
                                Text(
                                  'Số đêm',
                                  style: tStyle.HS12LB(),
                                ),
                                const Spacer(),
                                Text(
                                  '$dayCheck',
                                  style: tStyle.HS12LB(),
                                ),
                              ],
                            ),
                            SizedBox(height: Constants.bigPadding),
                            Row(
                              children: [
                                Text(
                                  'Tổng',
                                  style: tStyle.HS14Bold(),
                                ),
                                const Spacer(),
                                Text(
                                  '${FomartUtils.formatMoney(widget.arg.hotels.price * dayCheck)} VND',
                                  style: tStyle.HS14Bold(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: Constants.bigPadding),
                      Container(
                        padding: EdgeInsets.all(Constants.mediumPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              Constants.mediumBorderRadius),
                          color: AppColor.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Credit / Debit Card',
                                  style: tStyle.HS12LB(),
                                ),
                                Text(
                                  'Master Card',
                                  style: tStyle.HS14Bold(),
                                ),
                              ],
                            ),
                            ButtonNoBox(nameButton: 'Thay đổi'),
                          ],
                        ),
                      ),
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

  void onTapDone() async {
    YourBooked newPlace = YourBooked(
      idHotel: widget.arg.hotels.id,
      nameHotel: widget.arg.hotels.nameHotel,
      image: widget.arg.hotels.image[0],
      location: widget.arg.hotels.location,
      price: widget.arg.hotels.price,
      info: widget.arg.hotels.info,
      dateTimeCheckin: widget.arg.dateFrom,
      dateTimeCheckout: widget.arg.dateTo,
      totalPrice: widget.arg.hotels.price * dayCheck,
      passenger: widget.arg.passenger,
    );
    addPlaces(newPlace);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return DialogPrimary(
          title: 'Hoàn thành',
          onTap: () {
            Navigator.of(context)
              ..pop()
              ..pop()
              ..pop()
              ..pop();
          },
        );
      },
    );
  }
}
