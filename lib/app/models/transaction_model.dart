import 'dart:convert';

import '../entities/transaction.dart';
import 'category_model.dart';

class TransactionModel extends Transaction {
  TransactionModel({
    required String id,
    required String title,
    required double value,
    required DateTime date,
    required String userId,
    required CategoryModel? category,
  }) : super(
          userId: userId,
          id: id,
          title: title,
          value: value,
          date: date,
          category: category,
        );

  factory TransactionModel.fromMap(Map<String, dynamic> map) =>
      TransactionModel(
        userId: map['userId'] as String,
        id: map['id'] as String,
        title: map['title'] as String,
        value: map['value'] as double,
        date: DateTime.parse(map['date'].toString()),
        category: CategoryModel.fromJson(map['category'].toString()),
      );

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'value': value,
      'date': date.toIso8601String(),
      'category': jsonEncode(category?.toModel().toMap()),
    };
  }
}
