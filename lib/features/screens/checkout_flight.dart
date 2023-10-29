// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/features/screens/book_hotel.dart';
import 'package:travel/features/widgets/appbar.dart';
import 'package:travel/features/widgets/content_appbar_1.dart';
import 'package:travel/models/flights.dart';
import 'package:travel/models/places.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/typo.dart';

class CheckoutFlightArg {
  final Flight flight;
  final Places place;
  final DateTime dateTimeFlight;
  final int passenger;
  final String uid;
  CheckoutFlightArg({
    required this.flight,
    required this.place,
    required this.dateTimeFlight,
    required this.passenger,
    required this.uid,
  });
}

class CheckoutFlight extends StatefulWidget {
  const CheckoutFlight({super.key, required this.arg});
  final CheckoutFlightArg arg;
  static String routeName = '/checkout_flight';

  @override
  State<CheckoutFlight> createState() => _CheckoutFlightState();
}

class _CheckoutFlightState extends State<CheckoutFlight> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int money = widget.arg.passenger * widget.arg.flight.price;
    return Scaffold(
      body: Stack(
        children: [
          const AppBarWidget(),
          ContentAppBar1(
            isFull: true,
            title: 'Checkout',
            onTap: onTapBack,
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(mediumBorderRadius),
                  color: white),
              margin: EdgeInsets.only(
                  top: 220, left: bigPadding, right: bigPadding),
              padding: EdgeInsets.symmetric(horizontal: bigPadding),
              child: ListView(
                children: [
                  Column(
                    children: [
                      //head
                      Container(
                        padding: EdgeInsets.only(bottom: bigPadding),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(width: 0.5, color: grey))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Hà Nội', style: tStyle.HS24()),
                            SizedBox(width: smallestPadding),
                            Container(height: 1, width: 20, color: black),
                            SizedBox(width: smallestPadding),
                            RotatedBox(
                              quarterTurns: 1,
                              child: Icon(Icons.flight, color: black),
                            ),
                            SizedBox(width: smallestPadding),
                            Container(height: 1, width: 20, color: black),
                            SizedBox(width: smallestPadding),
                            Text(widget.arg.place.nameAirport,
                                style: tStyle.HS24()),
                          ],
                        ),
                      ),
                      SizedBox(height: bigPadding),

                      //thông tin hãng bay
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child:
                                  Image.asset(widget.arg.flight.imageFlight)),
                          SizedBox(width: bigPadding),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Airline', style: tStyle.HS12LB()),
                                SizedBox(height: smallestPadding),
                                Text('Name', style: tStyle.HS14Bold()),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Passengers', style: tStyle.HS12LB()),
                                SizedBox(height: smallestPadding),
                                Text('Name', style: tStyle.HS14Bold()),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: bigPadding),

                      //thông tin chuyến bay
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Date', style: tStyle.HS12LB()),
                                SizedBox(height: smallestPadding),
                                Text(
                                    DateFormat('MMM d, yyyy')
                                        .format(widget.arg.dateTimeFlight),
                                    style: tStyle.HS14Bold()),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Gate', style: tStyle.HS12LB()),
                                SizedBox(height: smallestPadding),
                                Text('24A', style: tStyle.HS14Bold()),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Flight No.', style: tStyle.HS12LB()),
                                SizedBox(height: smallestPadding),
                                Text(widget.arg.flight.noFlight,
                                    style: tStyle.HS14Bold()),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: bigPadding),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Boarding Time', style: tStyle.HS12LB()),
                                SizedBox(height: smallestPadding),
                                Text(
                                    DateFormat.jm().format(DateTime.parse(
                                        widget.arg.flight.departure)),
                                    style: tStyle.HS14Bold()),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Seat', style: tStyle.HS12LB()),
                                SizedBox(height: smallestPadding),
                                Text('5A', style: tStyle.HS14Bold()),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Class', style: tStyle.HS12LB()),
                                SizedBox(height: smallestPadding),
                                Text('Economy', style: tStyle.HS14Bold()),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: bigPadding),
                      Container(
                        height: 0.5,
                        width: double.infinity,
                        color: grey,
                      ),
                      SizedBox(height: bigPadding),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$${widget.arg.flight.price}/người',
                                  style: tStyle.HS20()),
                              Text('${widget.arg.passenger} người',
                                  style: tStyle.HS12LB())
                            ],
                          ),
                          SizedBox(height: bigPadding),
                          Text('Tổng: \$$money', style: tStyle.HS24())
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(bigPadding),
        child: ButtonPrimary(
          nameButton: 'Thanh toán',
          onTap: onTapBookHotel,
        ),
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapBookHotel() {
    Navigator.pushNamed(
      context,
      BookHotel.routeName,
      arguments: BookHotelArg(
        flight: widget.arg.flight,
        place: widget.arg.place,
        fromDateTime: widget.arg.dateTimeFlight,
        passenger: widget.arg.passenger,
        uid: widget.arg.uid,
      ),
    );
  }
}
