// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/components/dot.dart';
import 'package:travel/features/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:travel/models/intro_card.dart';

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
      backgroundColor: AppColor.lightgrey,
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
                    SizedBox(height: Constants.mediumPadding),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            introCards[index].title,
                            style: tStyle.HS24(),
                          ),
                          SizedBox(height: Constants.mediumPadding),
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
            padding: EdgeInsets.all(Constants.bigPadding),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: DotWidget(
                    mainAxisAlignment: MainAxisAlignment.start,
                    curIndex: currentIndex,
                    length: introCards.length,
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
