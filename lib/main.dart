// ignore_for_file: prefer_const_constructors

import 'package:travel/resource/color.dart';
import 'package:travel/routes.dart';
import 'package:travel/features/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: lightgrey,
      ),
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
