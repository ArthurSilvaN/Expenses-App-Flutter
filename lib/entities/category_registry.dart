import 'package:flutter/material.dart';

class CategoryRegistry {
  CategoryRegistry({
    required this.color,
    required this.name,
    required this.value,
    required this.id,
    required this.userId,
  });

  factory CategoryRegistry.fromMap(Map<String, dynamic> map) =>
      CategoryRegistry(
        id: map['id'] as String,
        userId: map['userId'] as String,
        name: map['name'] as String,
        value: map['valueCategory'] as double,
        color: Color(int.parse(map['colorCategory'].toString())),
      );

  final String id;
  final String name;
  late double value;
  final Color color;
  final String userId;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'valueCategory': value,
      'colorCategory': color.value.toString(),
    };
  }
}
