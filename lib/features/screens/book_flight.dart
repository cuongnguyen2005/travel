// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/components/btns/button_secondary.dart';
import 'package:travel/components/content_box/content_box.dart';
import 'package:travel/features/screens/book_hotel.dart';
import 'package:travel/features/screens/result_flight.dart';
import 'package:travel/features/widgets/appbar.dart';
import 'package:travel/features/widgets/content_appbar_1.dart';
import 'package:travel/features/widgets/select_passenger_widget.dart';
import 'package:travel/models/places.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';

class BookFlightArg {
  final Places place;
  final String uid;
  BookFlightArg({
    required this.place,
    required this.uid,
  });
}

class BookFlight extends StatefulWidget {
  const BookFlight({super.key, required this.arg});
  final BookFlightArg arg;
  static String routeName = '/book_flight';

  @override
  State<BookFlight> createState() => _BookFlightState();
}

class _BookFlightState extends State<BookFlight> {
  int passenger = 1;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background app bar
          const AppBarWidget(),
          ContentAppBar1(
            isFull: true,
            title: 'Đặt chuyến bay',
            onTap: onTapBack,
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(top: 200),
              margin: EdgeInsets.symmetric(horizontal: bigPadding),
              child: ListView(
                children: [
                  Column(
                    children: [
                      ContentBox(
                        icon: Icons.flight,
                        color: themeColor,
                        title: 'Từ',
                        content: 'Hà Nội',
                      ),
                      ContentBox(
                        icon: Icons.location_on,
                        color: pink,
                        title: 'Đến',
                        content: widget.arg.place.nameAirport,
                      ),
                      ContentBox(
                        icon: Icons.calendar_month,
                        color: orange,
                        title: 'Khởi hành',
                        content: DateFormat.yMd().format(selectedDate),
                        onTap: () async {
                          DateTime? chooseDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050),
                          );
                          if (chooseDate != null) {
                            setState(() {
                              selectedDate = chooseDate;
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
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ButtonSecondary(
                nameButton: 'Đặt phòng',
                onTap: onTapBookHotel,
              ),
            ),
            SizedBox(width: bigPadding),
            Expanded(
              flex: 1,
              child: ButtonPrimary(
                nameButton: 'Tìm kiếm',
                onTap: onTapSearch,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapSearch() {
    Navigator.pushNamed(context, ResultFlight.routeName,
        arguments: ResultFlightArg(
            uid: widget.arg.uid,
            place: widget.arg.place,
            dateTimeFlight: selectedDate,
            passenger: passenger));
  }

  void onTapBookHotel() {
    Navigator.pushNamed(context, BookHotel.routeName,
        arguments: BookHotelArg(place: widget.arg.place, uid: widget.arg.uid));
  }
}
