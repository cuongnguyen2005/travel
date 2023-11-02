// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class YourPlacesFavorite {
  int id;
  String nameHotel;
  String rating;
  String image;
  String location;
  int price;
  String info;

  YourPlacesFavorite({
    required this.id,
    required this.nameHotel,
    required this.rating,
    required this.image,
    required this.location,
    required this.price,
    required this.info,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameHotel': nameHotel,
      'rating': rating,
      'image': image,
      'location': location,
      'price': price,
      'info': info,
    };
  }

  factory YourPlacesFavorite.fromMap(Map<String, dynamic> map) {
    return YourPlacesFavorite(
      id: map['id'] as int,
      nameHotel: map['nameHotel'] as String,
      rating: map['rating'] as String,
      image: map['image'] as String,
      location: map['location'] as String,
      price: map['price'] as int,
      info: map['info'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory YourPlacesFavorite.fromJson(String source) =>
      YourPlacesFavorite.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'YourPlacesFavorite(id: $id, nameHotel: $nameHotel, rating: $rating,image: $image, location: $location, price: $price, info: $info)';
  }
}
