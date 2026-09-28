import 'package:flutter/material.dart';

class CategoryItem {
  const CategoryItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.bgColor,
  });

  final String id;
  final String name;
  final String imageUrl;
  final Color bgColor;
}
