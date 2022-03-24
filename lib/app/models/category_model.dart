// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:flutter/material.dart';

import '../entities/transaction_categorys.dart';

class CategoryModel extends Category {
  CategoryModel({
    required String name,
    required IconData icon,
    required Color color,
    required String id,
  }) : super(
          id: id,
          name: name,
          icon: icon,
          color: color,
        );

  factory CategoryModel.fromMap(Map<String, dynamic> map) => CategoryModel(
        id: map['id'] as String,
        name: map['name'] as String,
        icon: IconData(int.parse(map['icon'].toString())),
        color: Color(int.parse(map['color'].toString())),
      );

  factory CategoryModel.fromJson(String json) {
    final map = jsonDecode(json);
    return CategoryModel(
      id: map['id'] as String,
      name: map['name'] as String,
      icon: IconData(
        int.parse(map['icon'].toString()),
        fontFamily: 'MaterialIcons',
      ),
      color: Color(int.parse(map['color'].toString())),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon.codePoint.toString(),
      'color': color.value.toString(),
    };
  }
}
