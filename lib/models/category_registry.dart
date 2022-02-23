import 'package:flutter/material.dart';

class CategoryRegistry {
  CategoryRegistry({
    required this.color,
    required this.name,
    required this.value,
  });

  final MaterialColor color;
  final String name;
  late double value;
}
