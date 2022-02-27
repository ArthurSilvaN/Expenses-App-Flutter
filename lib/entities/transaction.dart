import 'transaction_categorys.dart';

class Transaction {
  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
    this.category,
  });

  final String id;
  final String title;
  final double value;
  final DateTime date;
  Category? category;
}
