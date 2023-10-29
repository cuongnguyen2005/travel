// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:travel/models/places.dart';

class YourBooked extends Places {
  final DateTime dateTimeCheckin;
  final DateTime dateTimeCheckout;
  final int passenger;
  YourBooked({
    required super.id,
    required super.nameAirport,
    required super.nameHotel,
    required super.namePlace,
    required super.rating,
    required super.image,
    required super.location,
    required super.price,
    required super.info,
    required super.cateName,
    required this.dateTimeCheckin,
    required this.dateTimeCheckout,
    required this.passenger,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateTimeCheckin': dateTimeCheckin.toIso8601String(),
      'dateTimeCheckout': dateTimeCheckout.toIso8601String(),
      'id': id,
      'nameAirport': nameAirport,
      'nameHotel': nameHotel,
      'namePlace': namePlace,
      'rating': rating,
      'image': image,
      'location': location,
      'price': price,
      'info': info,
      'cateName': cateName,
      'passenger': passenger,
    };
  }

  factory YourBooked.fromMap(Map<String, dynamic> map) {
    return YourBooked(
      dateTimeCheckin: DateTime.parse(map['dateTimeCheckin']),
      dateTimeCheckout: DateTime.parse(map['dateTimeCheckout']),
      id: map['id'] as int,
      nameAirport: map['nameAirport'] as String,
      nameHotel: map['nameHotel'] as String,
      namePlace: map['namePlace'] as String,
      rating: map['rating'] as String,
      image: map['image'] as String,
      location: map['location'] as String,
      price: map['price'] as int,
      info: map['location'] as String,
      cateName: map['cateName'] as String,
      passenger: map['passenger'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory YourBooked.fromJson(String source) =>
      YourBooked.fromMap(json.decode(source) as Map<String, dynamic>);
}
