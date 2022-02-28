import 'package:flutter/material.dart';

class CategoryRegistry {
  CategoryRegistry({
    required this.color,
    required this.name,
    required this.value,
  });

  factory CategoryRegistry.fromMap(Map<String, dynamic> map) =>
      CategoryRegistry(
        name: map['name'] as String,
        value: map['valueCategory'] as double,
        color: Color(int.parse(map['colorCategory'].toString())),
      );

  final Color color;
  final String name;
  late double value;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'valueCategory': value,
      'colorCategory': color.value.toString(),
    };
  }
}
