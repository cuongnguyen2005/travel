import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/features/widgets/appbar.dart';
import 'package:travel/models/places_favorite.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/shared_preferences.dart';
import 'package:travel/resource/typo.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key, required this.uid});
  final String uid;

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    getListPlacesWithUid();
    super.initState();
  }

  List<YourPlacesFavorite> listYourFav = [];
  void getListPlacesWithUid() async {
    List<YourPlacesFavorite> listPlacesFav = await getPlacesUid(widget.uid);
    setState(() {
      listYourFav = listPlacesFav;
    });
  }

  void deletePlace(int index) {
    listYourFav.remove(listYourFav[index]);
    saveYourPlaceFavorite(listYourFav, widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const AppBarWidget(),
          Column(
            children: [
              //title
              Container(
                padding: const EdgeInsets.only(top: 60),
                child: Center(
                    child: Text(
                  'Yêu thích',
                  style: tStyle.HS30(),
                )),
              ),
              SizedBox(height: bigPadding),

              //

              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: bigPadding),
                  child: ListView.builder(
                    itemCount: listYourFav.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: bigPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(bigBorderRadius),
                          color: white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //image
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(bigBorderRadius),
                                bottomRight: Radius.circular(bigBorderRadius),
                              ),
                              child: Image.asset(
                                listYourFav[index].image,
                                height: 160,
                                width: size.width * .8,
                                fit: BoxFit.fill,
                              ),
                            ),

                            //content
                            Container(
                              padding: EdgeInsets.all(smallPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listYourFav[index].namePlace,
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
                                        listYourFav[index].location,
                                        style: tStyle.HS12LB(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: smallestPadding),
                                  Container(
                                    padding:
                                        EdgeInsets.only(bottom: smallPadding),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 0.5, color: grey))),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: yellow,
                                        ),
                                        Text(
                                          '${listYourFav[index].rating} / 5',
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '\$ ${listYourFav[index].price}',
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
                                          nameButton: 'Bỏ thích',
                                          onTap: () => onTapRemove(index),
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
  void onTapRemove(int index) {
    setState(() {
      deletePlace(index);
    });
  }

  void onTapBack() {
    Navigator.pop(context);
  }
}
