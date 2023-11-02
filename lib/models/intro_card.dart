import 'package:flutter/material.dart';

class IntroCard {
  final String image;
  final String title;
  final String content;
  AlignmentGeometry alignment;
  IntroCard({
    required this.image,
    required this.title,
    required this.content,
    required this.alignment,
  });
}

List<IntroCard> introCards = [
  IntroCard(
    image: 'assets/images/intro1.png',
    title: 'Đặt 1 chuyến bay',
    content:
        'Tìm chuyến bay phù hợp với điểm đến và lịch trình của bạn? Đặt ngay nào!',
    alignment: Alignment.centerRight,
  ),
  IntroCard(
    image: 'assets/images/intro2.png',
    title: 'Tìm phòng khách sạn',
    content: 'Chọn ngày đặt phòng. Chúng tôi cung cấp cho bạn giá tốt nhất.',
    alignment: Alignment.center,
  ),
  IntroCard(
    image: 'assets/images/intro3.png',
    title: 'Tận hưởng chuyến đi',
    content:
        'Dễ dàng khám phá những địa điểm mới và chia sẻ những địa điểm này với bạn bè của bạn và cùng nhau đi du lịch.',
    alignment: Alignment.centerLeft,
  ),
];
