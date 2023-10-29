// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class Cate {
  String nameCate;
  Icon icon;
  Cate({
    required this.nameCate,
    required this.icon,
  });
}

List<Cate> cates = [
  Cate(nameCate: 'Domestic', icon: const Icon(Icons.hotel)),
  Cate(nameCate: 'Aboard', icon: const Icon(Icons.flight)),
];
