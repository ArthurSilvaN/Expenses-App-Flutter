import 'transaction_categorys.dart';

class Transaction {
  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
    required this.userId,
    this.category,
  });

  final String id;
  final String title;
  final double value;
  final DateTime date;
  final String userId;
  Category? category;
}
