import 'package:flutter/cupertino.dart';

import '../models/category_model.dart';

class Category {
  Category({
    required this.name,
    required this.color,
    required this.icon,
  });

  final String name;
  final Color color;
  final IconData icon;

  CategoryModel toModel() {
    return CategoryModel(name: name, icon: icon, color: color);
  }
}
