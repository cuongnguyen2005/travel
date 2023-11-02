import 'package:travel/features/screens/booked_page.dart';
import 'package:travel/features/screens/favorite_hotels.dart';
import 'package:travel/features/screens/home.dart';
import 'package:travel/features/screens/person_page.dart';
import 'package:travel/models/user_account.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key, required this.user});
  final UserAccount user;
  static String routeName = '/bottom_navi';

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      HomePage(user: widget.user),
      FavoritePage(uid: widget.user.uid),
      BookedPage(uid: widget.user.uid),
      PersonPage(user: widget.user),
    ];
    return Scaffold(
      bottomNavigationBar: Container(
        color: AppColor.white,
        child: Padding(
          padding: EdgeInsets.all(Constants.mediumPadding),
          child: GNav(
            selectedIndex: currentIndex,
            padding: EdgeInsets.all(Constants.mediumPadding),
            backgroundColor: AppColor.white,
            activeColor: AppColor.themeColor,
            tabBackgroundColor: AppColor.themeColor.withOpacity(0.2),
            color: AppColor.grey,
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.home_rounded,
                text: 'Trang chủ',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Yêu thích',
              ),
              GButton(
                icon: Icons.work,
                text: 'Booked',
              ),
              GButton(
                icon: Icons.person_sharp,
                text: 'Tài khoản',
              ),
            ],
            onTabChange: (value) {
              setState(() {
                currentIndex = value;
              });
            },
          ),
        ),
      ),
      body: tabs[currentIndex],
    );
  }
}
