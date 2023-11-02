// ignore_for_file: use_build_context_synchronously

import 'package:travel/features/screens/login/login.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/typo.dart';
import 'package:travel/features/screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getIsViewd();
    onBoard();
    super.initState();
  }

  int? isViewed;
  void getIsViewd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isViewed = prefs.getInt('onBoard');
  }

  onBoard() async {
    await Future.delayed(const Duration(seconds: 3));
    if (isViewed != 0) {
      Navigator.pushNamedAndRemoveUntil(
          context, IntroScreen.routeName, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginPage.routeName, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.themeColor,
      body: Center(
        child: Text(
          'Travel',
          style: tStyle.H64(),
        ),
      ),
    );
  }
}
