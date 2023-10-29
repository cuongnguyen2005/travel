// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/features/screens/detail_place.dart';
import 'package:travel/features/widgets/appbar.dart';
import 'package:travel/features/widgets/content_appbar_1.dart';
import 'package:travel/models/places.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/typo.dart';

class AllPlacesPageArg {
  final bool isDomesticList;
  final bool isAboardList;
  final String uid;
  AllPlacesPageArg({
    required this.isDomesticList,
    required this.isAboardList,
    required this.uid,
  });
}

class AllPlacesPage extends StatefulWidget {
  const AllPlacesPage({super.key, required this.arg});
  static String routeName = '/all_places';
  final AllPlacesPageArg arg;

  @override
  State<AllPlacesPage> createState() => _AllPlacesPageState();
}

class _AllPlacesPageState extends State<AllPlacesPage> {
  @override
  void initState() {
    super.initState();
    getAboardList();
    getDomesticList();
  }

  List<Places> domesticList = [];
  List<Places> aboardList = [];

  void getAboardList() {
    for (var element in places) {
      if (element.cateName == 'Aboard') {
        setState(() {
          aboardList.add(element);
        });
      }
    }
  }

  void getDomesticList() {
    for (var element in places) {
      if (element.cateName == 'Domestic') {
        setState(() {
          domesticList.add(element);
        });
      }
    }
  }

  bool isDomesticList = false;
  bool isAboardList = false;
  bool isAll = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (widget.arg.isAboardList == true && widget.arg.isDomesticList == false) {
      setState(() {
        isAboardList = true;
      });
    } else if (widget.arg.isAboardList == false &&
        widget.arg.isDomesticList == true) {
      setState(() {
        isDomesticList = true;
      });
    } else {
      setState(() {
        isAll = true;
      });
    }
    return Scaffold(
      body: Stack(
        children: [
          const AppBarWidget(),
          if (isAboardList)
            Column(
              children: [
                ContentAppBar1(
                  isFull: false,
                  onTap: onTapBack,
                  title: 'Quốc Tế',
                ),
                SizedBox(height: bigPadding),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: bigPadding),
                    child: ListView.builder(
                      itemCount: aboardList.length,
                      itemBuilder: (context, index) {
                        return ListViewWidget(
                          onTap: () => onTapDetailAboard(index),
                          index: index,
                          size: size,
                          image: aboardList[index].image,
                          name: aboardList[index].namePlace,
                          location: aboardList[index].location,
                          rating: aboardList[index].rating,
                          price: aboardList[index].price,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          if (isDomesticList)
            Column(
              children: [
                ContentAppBar1(
                  isFull: false,
                  onTap: onTapBack,
                  title: 'Nội Địa',
                ),
                SizedBox(height: bigPadding),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: bigPadding),
                    child: ListView.builder(
                      itemCount: domesticList.length,
                      itemBuilder: (context, index) {
                        return ListViewWidget(
                          onTap: () => onTapDetailDomestic(index),
                          index: index,
                          size: size,
                          image: domesticList[index].image,
                          name: domesticList[index].namePlace,
                          location: domesticList[index].location,
                          rating: domesticList[index].rating,
                          price: domesticList[index].price,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          if (isAll)
            Column(
              children: [
                ContentAppBar1(
                  isFull: false,
                  onTap: onTapBack,
                  title: 'Tất cả địa điểm',
                ),
                SizedBox(height: bigPadding),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: bigPadding),
                    child: ListView.builder(
                      itemCount: places.length,
                      itemBuilder: (context, index) {
                        return ListViewWidget(
                          onTap: () => onTapDetailAll(index),
                          index: index,
                          size: size,
                          image: places[index].image,
                          name: places[index].namePlace,
                          location: places[index].location,
                          rating: places[index].rating,
                          price: places[index].price,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  //
  void onTapDetailAll(int index) {
    Navigator.pushNamed(context, DetailPlace.routeName,
        arguments: DetailPlaceArg(place: places[index], uid: widget.arg.uid));
  }

  void onTapDetailDomestic(int index) {
    Navigator.pushNamed(context, DetailPlace.routeName,
        arguments:
            DetailPlaceArg(place: domesticList[index], uid: widget.arg.uid));
  }

  void onTapDetailAboard(int index) {
    Navigator.pushNamed(context, DetailPlace.routeName,
        arguments:
            DetailPlaceArg(place: aboardList[index], uid: widget.arg.uid));
  }

  void onTapBack() {
    Navigator.pop(context);
  }
}

class ListViewWidget extends StatelessWidget {
  ListViewWidget({
    Key? key,
    required this.index,
    required this.size,
    required this.image,
    required this.name,
    required this.location,
    required this.rating,
    required this.price,
    this.onTap,
  }) : super(key: key);
  final int index;
  final Size size;
  final String image;
  final String name;
  final String location;
  final String rating;
  final int price;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bigPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(bigBorderRadius),
        color: white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(bigBorderRadius),
              bottomRight: Radius.circular(bigBorderRadius),
            ),
            child: Image.asset(
              image,
              height: 160,
              width: size.width * .8,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.all(smallPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: tStyle.HS20(),
                ),
                SizedBox(height: smallestPadding),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 20,
                      color: pink,
                    ),
                    Text(
                      location,
                      style: tStyle.HS12LB(),
                    ),
                  ],
                ),
                SizedBox(height: smallestPadding),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 0.5, color: grey))),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 20,
                        color: yellow,
                      ),
                      Text(
                        '$rating / 5',
                        style: tStyle.HS14Medium(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: smallPadding),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$ $price',
                            style: tStyle.HS24(),
                          ),
                          Text(
                            '/ngày',
                            style: tStyle.HS12LB(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ButtonPrimary(
                        nameButton: 'Chi tiết',
                        onTap: onTap,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
