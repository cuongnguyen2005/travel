import 'package:travel/components/textformfield/text_form.dart';
import 'package:travel/features/screens/all_places_page.dart';
import 'package:travel/features/screens/detail_place.dart';
import 'package:travel/features/widgets/appbar.dart';
import 'package:travel/features/widgets/button_home.dart';
import 'package:travel/models/places.dart';
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
            padding: EdgeInsets.symmetric(horizontal: bigPadding),
            child: Column(
              children: [
                const SizedBox(height: 60),
                //content app bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(smallestPadding),
                          margin: EdgeInsets.all(smallestPadding),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(smallestPadding),
                              color: white),
                          child: Icon(
                            Icons.notifications,
                            color: themeColor,
                            size: 40,
                          ),
                        ),
                        CircleAvatar(
                          radius: 7,
                          backgroundColor: pink,
                        )
                      ],
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
                SizedBox(height: bigPadding),

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
                                      context, AllPlacesPage.routeName,
                                      arguments: AllPlacesPageArg(
                                        isDomesticList: true,
                                        isAboardList: false,
                                        uid: widget.user.uid,
                                      ));
                                });
                              },
                              text: 'Nội địa',
                              colorButton: orange.withOpacity(0.2),
                              image: 'assets/images/iconHome1.png',
                            ),
                          ),
                          SizedBox(width: bigPadding),
                          Expanded(
                            flex: 1,
                            child: ButtonHome(
                              onTap: () {
                                setState(() {
                                  Navigator.pushNamed(
                                      context, AllPlacesPage.routeName,
                                      arguments: AllPlacesPageArg(
                                        isDomesticList: false,
                                        isAboardList: true,
                                        uid: widget.user.uid,
                                      ));
                                });
                              },
                              text: 'Quốc tế',
                              colorButton: pink.withOpacity(0.2),
                              image: 'assets/images/iconHome2.png',
                            ),
                          ),
                          SizedBox(width: bigPadding),
                          Expanded(
                            flex: 1,
                            child: ButtonHome(
                              onTap: () {
                                setState(() {
                                  Navigator.pushNamed(
                                      context, AllPlacesPage.routeName,
                                      arguments: AllPlacesPageArg(
                                        isDomesticList: false,
                                        isAboardList: false,
                                        uid: widget.user.uid,
                                      ));
                                });
                              },
                              text: 'Tất cả',
                              colorButton: green.withOpacity(0.2),
                              image: 'assets/images/iconHome3.png',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: bigPadding),

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
                      SizedBox(height: bigPadding),

                      //show list places
                      SizedBox(
                        height: 240,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: mediumPadding),
                              width: size.width * .55,
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () => onTapShowDetail(index),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          bigBorderRadius),
                                      child: Image.asset(
                                        places[index].image,
                                        width: double.infinity,
                                        height: 240,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(mediumPadding),
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          places[index].namePlace,
                                          style: tStyle.HS16WBold(),
                                        ),
                                        SizedBox(height: smallestPadding),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.home,
                                              size: 20,
                                              color: orange,
                                            ),
                                            SizedBox(width: smallestPadding),
                                            Text(
                                              places[index].nameHotel,
                                              style: tStyle.HS14BoldW(),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: smallestPadding),
                                        Container(
                                          width: 70,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: white.withOpacity(0.3),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: yellow,
                                              ),
                                              Text(
                                                places[index].rating,
                                                style: tStyle.HS12LB(),
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
                      SizedBox(height: bigPadding),
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
        arguments: DetailPlaceArg(place: places[index], uid: widget.user.uid));
  }

  //function show all places
  void showAllPlaces() {
    Navigator.pushNamed(context, AllPlacesPage.routeName,
        arguments: AllPlacesPageArg(
            isDomesticList: false, isAboardList: false, uid: widget.user.uid));
  }
}
