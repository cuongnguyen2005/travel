import 'dart:math';

import 'package:travel/components/textformfield/text_form.dart';
import 'package:travel/features/book_hotel/all_hotels.dart';
import 'package:travel/features/book_hotel/detail_hotels.dart';
import 'package:travel/components/appbar.dart';
import 'package:travel/components/content/button_home.dart';
import 'package:travel/models/hotels.dart';
import 'package:travel/models/user_account.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/typo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user});
  final UserAccount user;

  static String routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getList();
    sufleList();
    super.initState();
  }

  List<Hotels> listHotel = [];
  void getList() {
    setState(() {
      listHotel = hotels;
    });
  }

  void sufleList() {
    setState(() {
      listHotel.shuffle();
    });
  }

  final searchController = TextEditingController();
  bool isDomesticList = false;
  bool isAboardList = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //background appbar
          const AppBarWidget(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: Constants.bigPadding),
            child: Column(
              children: [
                const SizedBox(height: 60),
                //content app bar
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Xin chào, ${widget.user.name}!',
                            style: tStyle.HS30(),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Bạn sẽ đi đâu tiếp theo?',
                            style: tStyle.HS12W(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(Constants.smallestPadding),
                            margin: EdgeInsets.all(Constants.smallestPadding),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Constants.smallestPadding),
                                color: AppColor.white),
                            child: Icon(
                              Icons.notifications,
                              color: AppColor.themeColor,
                              size: 40,
                            ),
                          ),
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: AppColor.pink,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                //search bar
                TextForm(
                  controller: searchController,
                  autofocus: false,
                  text: 'Tìm kiếm địa điểm đến của bạn',
                  prefixIcon: const Icon(Icons.search),
                ),
                SizedBox(height: Constants.bigPadding),

                Flexible(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      //show category
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: ButtonHome(
                              onTap: () {
                                setState(() {
                                  Navigator.pushNamed(
                                      context, AllHotelsPage.routeName,
                                      arguments: AllHotelsArg(
                                        uid: widget.user.uid,
                                      ));
                                });
                              },
                              text: 'Khách sạn',
                              colorButton: AppColor.orange.withOpacity(0.2),
                              image: 'assets/images/iconHome1.png',
                            ),
                          ),
                          SizedBox(width: Constants.bigPadding),
                          Expanded(
                            flex: 1,
                            child: ButtonHome(
                              onTap: () {
                                setState(() {});
                              },
                              text: 'Chuyến bay',
                              colorButton: AppColor.pink.withOpacity(0.2),
                              image: 'assets/images/iconHome2.png',
                            ),
                          ),
                          SizedBox(width: Constants.bigPadding),
                          Expanded(
                            flex: 1,
                            child: ButtonHome(
                              onTap: () {
                                setState(() {});
                              },
                              text: 'Tất cả',
                              colorButton: AppColor.green.withOpacity(0.2),
                              image: 'assets/images/iconHome3.png',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Constants.bigPadding),

                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Địa điểm phổ biến',
                            style: tStyle.HS18(),
                          ),
                          InkWell(
                            onTap: showAllPlaces,
                            child: Text(
                              'Tất cả',
                              style: tStyle.HS14BoldPurple(),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Constants.bigPadding),

                      //show list places
                      SizedBox(
                        height: 240,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  right: Constants.mediumPadding),
                              width: size.width * .55,
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () => onTapShowDetail(index),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          Constants.bigBorderRadius),
                                      child: Image.asset(
                                        listHotel[index].image[0],
                                        width: double.infinity,
                                        height: 240,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.all(Constants.mediumPadding),
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listHotel[index].nameHotel,
                                          style: tStyle.HS16WBold(),
                                        ),
                                        SizedBox(
                                            height: Constants.smallestPadding),
                                        Container(
                                          width: 70,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:
                                                AppColor.white.withOpacity(0.7),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: AppColor.yellow,
                                              ),
                                              Text(
                                                listHotel[index].rating,
                                                style: tStyle.HS14Bold(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: Constants.bigPadding),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //function show detail place
  void onTapShowDetail(int index) {
    Navigator.pushNamed(context, DetailPlace.routeName,
        arguments: DetailPlaceArg(hotels: hotels[index], uid: widget.user.uid));
  }

  //function show all places
  void showAllPlaces() {
    Navigator.pushNamed(context, AllHotelsPage.routeName,
        arguments: AllHotelsArg(uid: widget.user.uid));
  }
}
