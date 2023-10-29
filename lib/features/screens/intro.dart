// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/features/screens/login/login.dart';
import 'package:flutter/material.dart';

import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/typo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static String routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
  }

  storedOnBoard() async {
    int isViewd = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewd);
  }

  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 90),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: introCards.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                        alignment: introCards[index].alignment,
                        child: Image.asset(introCards[index].image)),
                    SizedBox(height: mediumPadding),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            introCards[index].title,
                            style: tStyle.HS24(),
                          ),
                          SizedBox(height: mediumPadding),
                          Text(
                            introCards[index].content,
                            style: tStyle.HS14Medium(),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(bigPadding),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    children: List.generate(
                      introCards.length,
                      (index) => Container(
                        height: smallestPadding,
                        width: currentIndex == index
                            ? bigPadding
                            : smallestPadding,
                        margin:
                            EdgeInsets.symmetric(horizontal: smallestPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == index ? orange : grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ButtonPrimary(
                    nameButton: currentIndex != introCards.length - 1
                        ? 'Tiếp tục'
                        : "Bắt đầu",
                    onTap: () => onTapNextPage(currentIndex, pageController),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onTapNextPage(currentIndex, pageController) async {
    await storedOnBoard();
    if (currentIndex == introCards.length - 1) {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginPage.routeName, (route) => false);
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
  }
}

///
class IntroCard {
  final String image;
  final String title;
  final String content;
  AlignmentGeometry alignment;
  IntroCard({
    required this.image,
    required this.title,
    required this.content,
    required this.alignment,
  });
}

List<IntroCard> introCards = [
  IntroCard(
    image: 'assets/images/intro1.png',
    title: 'Đặt 1 chuyến bay',
    content:
        'Tìm chuyến bay phù hợp với điểm đến và lịch trình của bạn? Đặt ngay nào!',
    alignment: Alignment.centerRight,
  ),
  IntroCard(
    image: 'assets/images/intro2.png',
    title: 'Tìm phòng khách sạn',
    content: 'Chọn ngày đặt phòng. Chúng tôi cung cấp cho bạn giá tốt nhất.',
    alignment: Alignment.center,
  ),
  IntroCard(
    image: 'assets/images/intro3.png',
    title: 'Tận hưởng chuyến đi',
    content:
        'Dễ dàng khám phá những địa điểm mới và chia sẻ những địa điểm này với bạn bè của bạn và cùng nhau đi du lịch.',
    alignment: Alignment.centerLeft,
  ),
];
