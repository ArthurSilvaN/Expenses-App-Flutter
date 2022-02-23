import 'package:flutter/cupertino.dart';

class Category {
  Category({
    required this.name,
    required this.color,
    required this.icon,
    required this.value,
  });

  final String name;
  final Color color;
  final IconData icon;
  final double value;
}
