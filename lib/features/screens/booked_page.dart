import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/components/appbar.dart';
import 'package:travel/components/content/content_hotel.dart';
import 'package:travel/models/user_account.dart';
import 'package:travel/models/your_book.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/shared_preferences.dart';
import 'package:travel/resource/typo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel/resource/utils/fomart.dart';

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
    getInfoUser();
    super.initState();
  }

  List<YourBooked> listYourBook = [];
  void getListBook() async {
    List<YourBooked> listYourBookStore =
        await SharedPreferencesLocal.getPlacesBookUid(widget.uid);
    setState(() {
      listYourBook = listYourBookStore;
    });
  }

  UserAccount? user;
  void getInfoUser() async {
    List<UserAccount> listUser = await SharedPreferencesLocal.getUserAccount();
    for (var element in listUser) {
      if (element.uid == widget.uid) {
        setState(() {
          user = element;
        });
      }
    }
  }

  int dayCheck = 1;

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: Constants.bigPadding),

              //

              Flexible(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: Constants.bigPadding),
                  child: ListView.builder(
                    itemCount: listYourBook.length,
                    itemBuilder: (context, index) {
                      return ContentHotelView(
                        image: listYourBook[index].image,
                        name: listYourBook[index].nameHotel,
                        location: listYourBook[index].location,
                        price: listYourBook[index].price,
                        isCheckButton: true,
                        onTap: () => onTapShowInfo(index),
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
              SizedBox(height: Constants.bigPadding),
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(Constants.smallBorderRadius),
                child: Image.asset(
                  listYourBook[index].image,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: Constants.bigPadding),
              Row(
                children: [
                  Image.asset('assets/images/checkin.png'),
                  SizedBox(width: Constants.smallPadding),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nhận phòng', style: tStyle.HS12LB()),
                      Text(
                          DateFormat.MMMEd()
                              .format(listYourBook[index].dateTimeCheckin),
                          style: tStyle.HS14Bold()),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Constants.bigPadding),
              Row(
                children: [
                  Image.asset('assets/images/checkout.png'),
                  SizedBox(width: Constants.smallPadding),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Trả phòng', style: tStyle.HS12LB()),
                      Text(
                          DateFormat.MMMEd()
                              .format(listYourBook[index].dateTimeCheckout),
                          style: tStyle.HS14Bold()),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Constants.biggerPadding),
              Container(
                height: 0.5,
                width: double.infinity,
                color: AppColor.grey,
              ),
              SizedBox(height: Constants.bigPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tên', style: tStyle.HS12LB()),
                  Text(user!.name, style: tStyle.HS12LB()),
                ],
              ),
              SizedBox(height: Constants.mediumPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1 đêm', style: tStyle.HS12LB()),
                  Text(
                      '${FomartUtils.formatMoney(listYourBook[index].price)} VND',
                      style: tStyle.HS12LB()),
                ],
              ),
              SizedBox(height: Constants.mediumPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Số đêm', style: tStyle.HS12LB()),
                  Text('$dayCheck', style: tStyle.HS12LB()),
                ],
              ),
              SizedBox(height: Constants.mediumPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Số người', style: tStyle.HS12LB()),
                  Text('${listYourBook[index].passenger}',
                      style: tStyle.HS12LB()),
                ],
              ),
              SizedBox(height: Constants.smallPadding),
              Container(
                height: 0.5,
                width: double.infinity,
                color: AppColor.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng', style: tStyle.HS14Bold()),
                  Text(
                      '${FomartUtils.formatMoney(listYourBook[index].totalPrice)} VND',
                      style: tStyle.HS14Bold()),
                ],
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(Constants.bigPadding),
              child: ButtonPrimary(nameButton: 'Ok', onTap: onTapBack),
            )
          ],
        );
      },
    );
  }
}
