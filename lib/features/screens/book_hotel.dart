// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:travel/components/dialog/dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/components/content_box/content_box.dart';
import 'package:travel/features/widgets/appbar.dart';
import 'package:travel/features/widgets/content_appbar_1.dart';
import 'package:travel/features/widgets/select_passenger_widget.dart';
import 'package:travel/models/flights.dart';
import 'package:travel/models/places.dart';
import 'package:travel/models/your_book.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/shared_preferences.dart';

class BookHotelArg {
  final Places place;
  final DateTime? fromDateTime;
  final Flight? flight;
  final int? passenger;
  final String uid;
  BookHotelArg({
    required this.place,
    this.fromDateTime,
    this.flight,
    this.passenger,
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
  @override
  void initState() {
    getInfo();
    getPlaceBook();
    super.initState();
  }

  List<YourBooked> listYourBook = [];
  void getPlaceBook() async {
    listYourBook = await getPlacesBookUid(widget.arg.uid);
  }

  void addPlaces(YourBooked newPlace) {
    setState(() {
      listYourBook.add(newPlace);
    });
    saveYourPlaceBooked(listYourBook, widget.arg.uid);
  }

  int passenger = 1;

  DateTime selectedDateTo = DateTime.now();
  DateTime selectedDateFrom = DateTime.now();
  void getInfo() {
    setState(() {
      passenger = widget.arg.passenger ?? 1;
      selectedDateFrom = widget.arg.fromDateTime ?? DateTime.now();
    });
  }

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
            padding: EdgeInsets.symmetric(horizontal: bigPadding),
            child: Column(
              children: [
                const SizedBox(height: 200),
                //
                Flexible(
                  child: ListView(
                    children: [
                      ContentBox(
                        icon: Icons.calendar_month,
                        color: pink,
                        title: 'Từ ngày',
                        content: DateFormat.yMd().format(selectedDateFrom),
                        onTap: () async {
                          DateTime? chooseDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
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
                        color: pink,
                        title: 'Đến ngày',
                        content: DateFormat.yMd().format(selectedDateTo),
                        onTap: () async {
                          DateTime? chooseDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(bigPadding),
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
      id: widget.arg.place.id,
      nameAirport: widget.arg.place.nameAirport,
      nameHotel: widget.arg.place.nameHotel,
      namePlace: widget.arg.place.namePlace,
      rating: widget.arg.place.rating,
      image: widget.arg.place.image,
      location: widget.arg.place.location,
      price: widget.arg.place.price,
      info: widget.arg.place.info,
      cateName: widget.arg.place.cateName,
      dateTimeCheckin: selectedDateFrom,
      dateTimeCheckout: selectedDateTo,
      passenger: passenger,
    );
    addPlaces(newPlace);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return DialogPrimary(
          title: 'Hoàn thành',
          onTap: () {
            if (widget.arg.flight == null) {
              Navigator.of(context)
                ..pop()
                ..pop()
                ..pop()
                ..pop();
            } else {
              Navigator.of(context)
                ..pop()
                ..pop()
                ..pop()
                ..pop()
                ..pop()
                ..pop();
            }
          },
        );
      },
    );
  }
}
