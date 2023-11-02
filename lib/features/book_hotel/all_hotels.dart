// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:travel/components/content/content_hotel.dart';
import 'package:travel/components/textformfield/text_form.dart';
import 'package:travel/features/book_hotel/detail_hotels.dart';
import 'package:travel/components/appbar.dart';
import 'package:travel/components/content/content_appbar_1.dart';
import 'package:travel/models/hotels.dart';
import 'package:travel/resource/constant.dart';

class AllHotelsArg {
  final String uid;
  AllHotelsArg({
    required this.uid,
  });
}

class AllHotelsPage extends StatefulWidget {
  const AllHotelsPage({super.key, required this.arg});
  static String routeName = '/all_hotels';
  final AllHotelsArg arg;

  @override
  State<AllHotelsPage> createState() => _AllHotelsPageState();
}

class _AllHotelsPageState extends State<AllHotelsPage> {
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

  void getHotelListSearch(String value) {
    setState(() {
      listHotel = hotels
          .where((element) =>
              element.findLocation.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppBarWidget(),
          Column(
            children: [
              ContentAppBar1(
                isFull: false,
                onTap: onTapBack,
                title: 'Khách sạn',
              ),
              SizedBox(height: Constants.mediumPadding),
              Padding(
                padding: EdgeInsets.all(Constants.bigPadding),
                child: TextForm(
                  onChanged: (value) => getHotelListSearch(value),
                  controller: searchController,
                  autofocus: false,
                  text: 'Tìm kiếm theo khu vực',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              Flexible(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: Constants.bigPadding),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: listHotel.length,
                    itemBuilder: (context, index) {
                      return ContentHotelView(
                        onTap: () => onTapGetHotel(index),
                        image: listHotel[index].image[0],
                        name: listHotel[index].nameHotel,
                        location: listHotel[index].location,
                        rating: listHotel[index].rating,
                        price: listHotel[index].price,
                        isCheckNameButton: true,
                        isCheckButton: false,
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
  void onTapGetHotel(int index) {
    Navigator.pushNamed(context, DetailPlace.routeName,
        arguments:
            DetailPlaceArg(hotels: listHotel[index], uid: widget.arg.uid));
  }

  void onTapBack() {
    Navigator.pop(context);
  }
}
