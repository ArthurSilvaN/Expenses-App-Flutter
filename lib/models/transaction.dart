class Transaction {
  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });

  final String id;
  final String title;
  final String value;
  final DateTime date;
}
