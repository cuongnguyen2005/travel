// ignore_for_file: unused_import

import 'package:travel/features/screens/all_places_page.dart';
import 'package:travel/features/screens/book_flight.dart';
import 'package:travel/features/screens/book_hotel.dart';
import 'package:travel/features/screens/bottom_navigation.dart';
import 'package:travel/features/screens/checkout_flight.dart';
import 'package:travel/features/screens/detail_place.dart';
import 'package:travel/features/screens/home.dart';
import 'package:travel/features/screens/intro.dart';
import 'package:travel/features/screens/login/login.dart';
import 'package:travel/features/screens/result_flight.dart';
import 'package:travel/features/screens/signup/signup.dart';
import 'package:travel/features/screens/splash_screen.dart';
import 'package:travel/models/places.dart';
import 'package:travel/models/user_account.dart';
import 'package:flutter/material.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
  if (settings.name == SplashScreen.routeName) {
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
  if (settings.name == IntroScreen.routeName) {
    return MaterialPageRoute(builder: (_) => const IntroScreen());
  }
  if (settings.name == LoginPage.routeName) {
    final String? arg = settings.arguments as String?;
    return MaterialPageRoute(
        builder: (_) => LoginPage(
              userName: arg,
            ));
  }
  if (settings.name == SignupPage.routeName) {
    return MaterialPageRoute(builder: (_) => const SignupPage());
  }
  if (settings.name == HomePage.routeName) {
    final UserAccount arg = settings.arguments as UserAccount;
    return MaterialPageRoute(
        builder: (_) => HomePage(
              user: arg,
            ));
  }
  if (settings.name == BottomNavigationPage.routeName) {
    final UserAccount arg = settings.arguments as UserAccount;
    return MaterialPageRoute(
        builder: (_) => BottomNavigationPage(
              user: arg,
            ));
  }
  if (settings.name == DetailPlace.routeName) {
    final DetailPlaceArg arg = settings.arguments as DetailPlaceArg;
    return MaterialPageRoute(
        builder: (_) => DetailPlace(
              arg: arg,
            ));
  }
  if (settings.name == AllPlacesPage.routeName) {
    final AllPlacesPageArg arg = settings.arguments as AllPlacesPageArg;
    return MaterialPageRoute(
        builder: (_) => AllPlacesPage(
              arg: arg,
            ));
  }
  if (settings.name == BookFlight.routeName) {
    final BookFlightArg arg = settings.arguments as BookFlightArg;
    return MaterialPageRoute(
        builder: (_) => BookFlight(
              arg: arg,
            ));
  }
  if (settings.name == ResultFlight.routeName) {
    final ResultFlightArg arg = settings.arguments as ResultFlightArg;
    return MaterialPageRoute(
        builder: (_) => ResultFlight(
              arg: arg,
            ));
  }
  if (settings.name == BookHotel.routeName) {
    final BookHotelArg arg = settings.arguments as BookHotelArg;
    return MaterialPageRoute(
        builder: (_) => BookHotel(
              arg: arg,
            ));
  }
  if (settings.name == CheckoutFlight.routeName) {
    final CheckoutFlightArg arg = settings.arguments as CheckoutFlightArg;
    return MaterialPageRoute(
        builder: (_) => CheckoutFlight(
              arg: arg,
            ));
  }

  return null;
};
