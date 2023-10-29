import 'dart:convert';

import 'package:travel/models/places_favorite.dart';
import 'package:travel/models/user_account.dart';
import 'package:travel/models/your_book.dart';
import 'package:shared_preferences/shared_preferences.dart';

final List<UserAccount> userAccountList = [];
final List<YourPlacesFavorite> yourPlacesList = [];

///Lấy dữ liệu user account
Future<List<UserAccount>> getUserAccount() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String>? items = prefs.getStringList('userAccount');
  if (items != null) {
    final users = items.map((e) => UserAccount.fromJson(e)).toList();
    return users;
  } else {
    return userAccountList;
  }
}

///Lấy dữ liệu places fav with user uid
Future<List<YourPlacesFavorite>> getPlacesUid(String uid) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String>? items = prefs.getStringList('places$uid');
  if (items != null) {
    final places = items.map((e) => YourPlacesFavorite.fromJson(e)).toList();
    return places;
  } else {
    return [];
  }
}

///Lấy dữ liệu places booked with user uid
Future<List<YourBooked>> getPlacesBookUid(String uid) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String>? items = prefs.getStringList('placeBooked$uid');
  if (items != null) {
    final places = items.map((e) => YourBooked.fromJson(e)).toList();
    return places;
  } else {
    return [];
  }
}

///Lưu dữ liệu user account xuống local
Future<void> saveUserAccount(List<UserAccount> userAccount) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //chuyển list thành 1 list Map
  final List<Map<String, dynamic>> listUserMap =
      userAccount.map((e) => e.toMap()).toList();
  //chuyển list Map thành 1 list String
  final newListString = listUserMap.map((map) => json.encode(map)).toList();
  prefs.setStringList('userAccount', newListString);
}

///Lưu places favorite xuống local
Future<void> saveYourPlaceFavorite(
    List<YourPlacesFavorite> places, String uid) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //chuyển list thành 1 list Map
  final List<Map<String, dynamic>> listPlaces =
      places.map((e) => e.toMap()).toList();
  //chuyển list Map thành 1 list String
  final newListString = listPlaces.map((map) => json.encode(map)).toList();
  prefs.setStringList('places$uid', newListString);
}

///Lưu places bookes xuống local
Future<void> saveYourPlaceBooked(List<YourBooked> places, String uid) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //chuyển list thành 1 list Map
  final List<Map<String, dynamic>> listPlaces =
      places.map((e) => e.toMap()).toList();
  //chuyển list Map thành 1 list String
  final newListString = listPlaces.map((map) => json.encode(map)).toList();
  prefs.setStringList('placeBooked$uid', newListString);
}
