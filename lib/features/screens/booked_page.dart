import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/features/widgets/appbar.dart';
import 'package:travel/models/your_book.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/shared_preferences.dart';
import 'package:travel/resource/typo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookedPage extends StatefulWidget {
  const BookedPage({super.key, required this.uid});
  final String uid;

  @override
  State<BookedPage> createState() => _BookedPageState();
}

class _BookedPageState extends State<BookedPage> {
  @override
  void initState() {
    getListBook();
    super.initState();
  }

  List<YourBooked> listYourBook = [];
  void getListBook() async {
    List<YourBooked> listYourBookStore = await getPlacesBookUid(widget.uid);
    setState(() {
      listYourBook = listYourBookStore;
    });
  }

  int dayCheck = 1;

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
                  'Booked',
                  style: tStyle.HS30(),
                )),
              ),
              SizedBox(height: bigPadding),

              //

              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: bigPadding),
                  child: ListView.builder(
                    itemCount: listYourBook.length,
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
                                listYourBook[index].image,
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
                                    listYourBook[index].namePlace,
                                    style: tStyle.HS20(),
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
                                          Icons.location_on,
                                          size: 20,
                                          color: pink,
                                        ),
                                        Text(
                                          listYourBook[index].location,
                                          style: tStyle.HS12LB(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: smallPadding),
                                  Padding(
                                    padding: EdgeInsets.all(smallPadding),
                                    child: ButtonPrimary(
                                      nameButton: 'Thông tin phòng',
                                      onTap: () => onTapShowInfo(index),
                                    ),
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

  void onTapBack() {
    Navigator.of(context).pop();
  }

  void onTapShowInfo(index) {
    int dayCheckin = listYourBook[index].dateTimeCheckin.day;
    int dayCheckout = listYourBook[index].dateTimeCheckout.day;
    if (dayCheckin == dayCheckout) {
      setState(() {
        dayCheck = 1;
      });
    } else if (dayCheckout > dayCheckin) {
      setState(() {
        dayCheck = dayCheckout - dayCheckin;
      });
    } else if (dayCheckout < dayCheckin) {
      setState(() {
        dayCheck = dayCheckin - dayCheckout;
      });
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            children: [
              Text(
                listYourBook[index].nameHotel,
                style: tStyle.HS18(),
              ),
              SizedBox(height: bigPadding),
              ClipRRect(
                borderRadius: BorderRadius.circular(smallBorderRadius),
                child: Image.asset(
                  listYourBook[index].image,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: bigPadding),
              Row(
                children: [
                  Image.asset('assets/images/checkin.png'),
                  SizedBox(width: smallPadding),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Check-in', style: tStyle.HS12LB()),
                      Text(
                          DateFormat.MMMEd()
                              .format(listYourBook[index].dateTimeCheckin),
                          style: tStyle.HS14Bold()),
                    ],
                  ),
                ],
              ),
              SizedBox(height: bigPadding),
              Row(
                children: [
                  Image.asset('assets/images/checkout.png'),
                  SizedBox(width: smallPadding),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Check-out', style: tStyle.HS12LB()),
                      Text(
                          DateFormat.MMMEd()
                              .format(listYourBook[index].dateTimeCheckout),
                          style: tStyle.HS14Bold()),
                    ],
                  ),
                ],
              ),
              SizedBox(height: biggerPadding),
              Container(
                height: 0.5,
                width: double.infinity,
                color: grey,
              ),
              SizedBox(height: bigPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1 ngày', style: tStyle.HS12LB()),
                  Text('\$${listYourBook[index].price}',
                      style: tStyle.HS12LB()),
                ],
              ),
              SizedBox(height: bigPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Số ngày', style: tStyle.HS12LB()),
                  Text('$dayCheck', style: tStyle.HS12LB()),
                ],
              ),
              SizedBox(height: smallPadding),
              Container(
                height: 0.5,
                width: double.infinity,
                color: grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: tStyle.HS14Bold()),
                  Text('\$${listYourBook[index].price * dayCheck}',
                      style: tStyle.HS14Bold()),
                ],
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(bigPadding),
              child: ButtonPrimary(nameButton: 'Ok', onTap: onTapBack),
            )
          ],
        );
      },
    );
  }
}
