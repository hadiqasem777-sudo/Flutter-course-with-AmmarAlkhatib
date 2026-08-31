import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final Color color;
  final String title;
  final String imageUrl;

  const Category({
    required this.id,
    required this.name,
    required this.title,
    required this.color,
    required this.imageUrl,
  });
}
