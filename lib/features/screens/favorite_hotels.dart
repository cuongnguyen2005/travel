import 'package:travel/components/appbar.dart';
import 'package:travel/components/content/content_hotel.dart';
import 'package:travel/models/places_favorite.dart';
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
    List<YourPlacesFavorite> listPlacesFav =
        await SharedPreferencesLocal.getPlacesUid(widget.uid);
    setState(() {
      listYourFav = listPlacesFav;
    });
  }

  void deletePlace(int index) {
    listYourFav.remove(listYourFav[index]);
    SharedPreferencesLocal.saveYourPlaceFavorite(listYourFav, widget.uid);
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
                padding: EdgeInsets.only(top: size.height * 0.1),
                child: Center(
                    child: Text(
                  'Yêu thích',
                  style: tStyle.HS30(),
                )),
              ),
              SizedBox(height: Constants.bigPadding),

              //body
              Flexible(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: Constants.bigPadding),
                  child: ListView.builder(
                    itemCount: listYourFav.length,
                    itemBuilder: (context, index) {
                      return ContentHotelView(
                        image: listYourFav[index].image,
                        name: listYourFav[index].nameHotel,
                        location: listYourFav[index].location,
                        rating: listYourFav[index].rating,
                        price: listYourFav[index].price,
                        isCheckNameButton: false,
                        isCheckButton: false,
                        onTap: () => onTapRemove(index),
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
