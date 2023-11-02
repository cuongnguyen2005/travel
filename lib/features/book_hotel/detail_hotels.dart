// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:travel/components/dialog/dialog.dart';
import 'package:flutter/material.dart';

import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/components/dot.dart';
import 'package:travel/features/book_hotel/book_hotel.dart';
import 'package:travel/components/content/content_appbar_1.dart';
import 'package:travel/components/content/convenient.dart';
import 'package:travel/models/hotels.dart';
import 'package:travel/models/places_favorite.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/shared_preferences.dart';
import 'package:travel/resource/typo.dart';
import 'package:travel/resource/utils/fomart.dart';

class DetailPlaceArg {
  final Hotels hotels;
  final String uid;
  DetailPlaceArg({
    required this.hotels,
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
    listPlacesFav = await SharedPreferencesLocal.getPlacesUid(widget.arg.uid);
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
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  curIndex = value;
                });
              },
              itemCount: widget.arg.hotels.image.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius:
                      BorderRadius.circular(Constants.mediumBorderRadius),
                  child: Image.asset(
                    widget.arg.hotels.image[index],
                    fit: BoxFit.fill,
                    height: size.height * 0.57,
                    width: double.infinity,
                  ),
                );
              },
            ),
          ),
          DotWidget(
            mainAxisAlignment: MainAxisAlignment.center,
            margin: EdgeInsets.only(top: size.height * 0.54),
            curIndex: curIndex,
            length: widget.arg.hotels.image.length,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: Constants.bigPadding, top: 60),
              child: InkWell(
                onTap: onTapFavorite,
                child:
                    const CircleAvatar(radius: 20, child: Icon(Icons.favorite)),
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
                  color: AppColor.white,
                  padding: EdgeInsets.only(
                    top: Constants.bigPadding,
                    left: Constants.bigPadding,
                    right: Constants.bigPadding,
                    bottom: 100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(bottom: Constants.smallPadding),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: AppColor.grey))),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.arg.hotels.nameHotel,
                                  style: tStyle.HS20(),
                                ),
                                SizedBox(height: Constants.smallPadding),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColor.pink,
                                    ),
                                    Text(
                                      widget.arg.hotels.location,
                                      style: tStyle.HS12LB(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: Constants.smallestPadding),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColor.yellow,
                                ),
                                Text(
                                  '${widget.arg.hotels.rating} / 5',
                                  style: tStyle.HS14Bold(),
                                ),
                              ],
                            ),
                            SizedBox(height: Constants.smallPadding),
                            const Convenient(),
                          ],
                        ),
                      ),
                      SizedBox(height: Constants.smallPadding),
                      Text(
                        'Thông tin',
                        style: tStyle.HS16Bold(),
                      ),
                      SizedBox(height: Constants.smallestPadding),
                      Text(
                        widget.arg.hotels.info,
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
        color: AppColor.white,
        padding: EdgeInsets.all(Constants.bigPadding),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${FomartUtils.formatMoney(widget.arg.hotels.price)} VND',
                    style: tStyle.HS20(),
                  ),
                  Text(
                    '/đêm',
                    style: tStyle.HS12LB(),
                  ),
                ],
              ),
            ),
            SizedBox(width: Constants.bigPadding),
            Expanded(
              flex: 2,
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
    Navigator.pushNamed(context, BookHotel.routeName,
        arguments:
            BookHotelArg(hotels: widget.arg.hotels, uid: widget.arg.uid));
  }

  ///
  void onTapFavorite() async {
    bool isCheck = false;
    for (var element in listPlacesFav) {
      if (element.id == widget.arg.hotels.id) {
        isCheck = true;
      }
    }
    if (isCheck == false) {
      final YourPlacesFavorite newplace = YourPlacesFavorite(
        id: widget.arg.hotels.id,
        nameHotel: widget.arg.hotels.nameHotel,
        rating: widget.arg.hotels.rating,
        image: widget.arg.hotels.image[0],
        location: widget.arg.hotels.location,
        price: widget.arg.hotels.price,
        info: widget.arg.hotels.info,
      );
      setState(() {
        listPlacesFav.add(newplace);
      });
      SharedPreferencesLocal.saveYourPlaceFavorite(
          listPlacesFav, widget.arg.uid);
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
            title: 'Khách sạn này đã nằm trong danh mục yêu thích',
            onTap: onTapBack,
          );
        },
      );
    }
  }
}
