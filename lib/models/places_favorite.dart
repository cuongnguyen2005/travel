// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class YourPlacesFavorite {
  int id;
  String nameAirport;
  String nameHotel;
  String namePlace;
  String rating;
  String image;
  String location;
  int price;
  String info;
  String cateName;

  YourPlacesFavorite({
    required this.id,
    required this.nameAirport,
    required this.nameHotel,
    required this.namePlace,
    required this.rating,
    required this.image,
    required this.location,
    required this.price,
    required this.info,
    required this.cateName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
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
    };
  }

  factory YourPlacesFavorite.fromMap(Map<String, dynamic> map) {
    return YourPlacesFavorite(
      id: map['id'] as int,
      nameAirport: map['nameAirport'] as String,
      nameHotel: map['nameHotel'] as String,
      namePlace: map['namePlace'] as String,
      rating: map['rating'] as String,
      image: map['image'] as String,
      location: map['location'] as String,
      price: map['price'] as int,
      info: map['info'] as String,
      cateName: map['cateName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory YourPlacesFavorite.fromJson(String source) =>
      YourPlacesFavorite.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'YourPlacesFavorite(id: $id, nameAirport: $nameAirport, nameHotel: $nameHotel, namePlace: $namePlace, rating: $rating,image: $image, location: $location, price: $price, info: $info, cateName: $cateName,)';
  }
}
