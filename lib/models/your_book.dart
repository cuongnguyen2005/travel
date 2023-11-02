// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class YourBooked {
  DateTime dateTimeCheckin;
  DateTime dateTimeCheckout;
  int totalPrice;
  int passenger;
  int idHotel;
  String nameHotel;
  String image;
  String location;
  int price;
  String info;

  YourBooked({
    required this.dateTimeCheckin,
    required this.dateTimeCheckout,
    required this.totalPrice,
    required this.passenger,
    required this.idHotel,
    required this.nameHotel,
    required this.image,
    required this.location,
    required this.price,
    required this.info,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateTimeCheckin': dateTimeCheckin.toIso8601String(),
      'dateTimeCheckout': dateTimeCheckout.toIso8601String(),
      'totalPrice': totalPrice,
      'passenger': passenger,
      'id': idHotel,
      'nameHotel': nameHotel,
      'image': image,
      'location': location,
      'price': price,
      'info': info,
    };
  }

  factory YourBooked.fromMap(Map<String, dynamic> map) {
    return YourBooked(
      dateTimeCheckin: DateTime.parse(map['dateTimeCheckin']),
      dateTimeCheckout: DateTime.parse(map['dateTimeCheckout']),
      totalPrice: map['totalPrice'] as int,
      passenger: map['passenger'] as int,
      idHotel: map['id'] as int,
      nameHotel: map['nameHotel'] as String,
      image: map['image'] as String,
      location: map['location'] as String,
      price: map['price'] as int,
      info: map['location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory YourBooked.fromJson(String source) =>
      YourBooked.fromMap(json.decode(source) as Map<String, dynamic>);
}
