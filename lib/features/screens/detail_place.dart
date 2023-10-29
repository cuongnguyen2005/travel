// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:travel/components/dialog/dialog.dart';
import 'package:flutter/material.dart';

import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/features/screens/book_flight.dart';
import 'package:travel/features/widgets/content_appbar_1.dart';
import 'package:travel/models/places.dart';
import 'package:travel/models/places_favorite.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/shared_preferences.dart';
import 'package:travel/resource/typo.dart';

class DetailPlaceArg {
  final Places place;
  final String uid;
  DetailPlaceArg({
    required this.place,
    required this.uid,
  });
}

class DetailPlace extends StatefulWidget {
  const DetailPlace({super.key, required this.arg});
  static String routeName = '/detail_place';
  final DetailPlaceArg arg;

  @override
  State<DetailPlace> createState() => _DetailPlaceState();
}

class _DetailPlaceState extends State<DetailPlace> {
  @override
  void initState() {
    super.initState();
    getListPlacesWithUid();
  }

  List<YourPlacesFavorite> listPlacesFav = [];
  void getListPlacesWithUid() async {
    listPlacesFav = await getPlacesUid(widget.arg.uid);
  }

  final pageController = PageController();
  int curIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //picture
          SizedBox(
            height: size.height * 0.57,
            width: size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(mediumBorderRadius),
              child: Image.asset(
                widget.arg.place.image,
                fit: BoxFit.fill,
              ),
            ),
          ),

          //content place
          Container(
            padding: EdgeInsets.only(top: size.height * 0.57),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  color: white,
                  padding: EdgeInsets.only(
                    top: bigPadding,
                    left: bigPadding,
                    right: bigPadding,
                    bottom: 100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.arg.place.namePlace,
                        style: tStyle.HS20(),
                      ),
                      SizedBox(height: smallestPadding),
                      Container(
                        padding: EdgeInsets.only(bottom: smallPadding),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(width: 0.5, color: grey))),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: pink,
                            ),
                            Text(
                              widget.arg.place.location,
                              style: tStyle.HS12LB(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: smallPadding),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(width: 0.5, color: grey))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.home,
                                  color: orange,
                                ),
                                SizedBox(width: smallestPadding),
                                Text(
                                  widget.arg.place.nameHotel,
                                  style: tStyle.HS20(),
                                ),
                                const Spacer(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$ 245',
                                      style: tStyle.HS24(),
                                    ),
                                    Text(
                                      '/ngày',
                                      style: tStyle.HS12LB(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: smallestPadding),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: yellow,
                                ),
                                Text(
                                  '${widget.arg.place.rating} / 5',
                                  style: tStyle.HS14Bold(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: smallPadding),
                      Text(
                        'Thông tin',
                        style: tStyle.HS16Bold(),
                      ),
                      SizedBox(height: smallestPadding),
                      Text(
                        widget.arg.place.info,
                        style: tStyle.HS14Medium(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ContentAppBar1(
            isFull: false,
            onTap: onTapBack,
          ),
        ],
      ),

      //bottom sheet
      bottomSheet: Container(
        color: white,
        padding: EdgeInsets.all(bigPadding),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: onTapFavorite,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(bigBorderRadius),
                    color: pink.withOpacity(0.5),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.favorite_border,
                    color: white,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(width: bigPadding),
            Expanded(
              flex: 4,
              child: ButtonPrimary(
                nameButton: 'Đặt ngay',
                onTap: onTapBook,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///function on tap back
  void onTapBack() {
    Navigator.of(context).pop();
  }

  ///function on tap book
  void onTapBook() {
    Navigator.pushNamed(context, BookFlight.routeName,
        arguments: BookFlightArg(place: widget.arg.place, uid: widget.arg.uid));
  }

  ///
  void onTapFavorite() async {
    bool isCheck = false;
    for (var element in listPlacesFav) {
      if (element.id == widget.arg.place.id) {
        isCheck = true;
      }
    }
    if (isCheck == false) {
      final YourPlacesFavorite newplace = YourPlacesFavorite(
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
      );
      setState(() {
        listPlacesFav.add(newplace);
      });
      saveYourPlaceFavorite(listPlacesFav, widget.arg.uid);
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return DialogPrimary(
            title: 'Đã thêm vào mục yêu thích',
            onTap: onTapBack,
          );
        },
      );
    }
    if (isCheck == true) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return DialogPrimary(
            title: 'Địa điểm này đã nằm trong danh mục yêu thích',
            onTap: onTapBack,
          );
        },
      );
    }
  }
}
