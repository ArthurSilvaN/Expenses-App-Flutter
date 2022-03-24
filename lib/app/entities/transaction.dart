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

  late final String id;
  late final String title;
  late final double value;
  late final DateTime date;
  late final String userId;
  Category? category;
}
