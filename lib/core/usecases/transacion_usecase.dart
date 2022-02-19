import 'dart:math';

import '../../models/transaction.dart';

class TransactionUsecase {
  TransactionUsecase();

  List<Transaction> transactions = [
    Transaction(date: DateTime.now(), id: '1', title: 'teste1', value: 55),
    Transaction(date: DateTime.now(), id: '2', title: 'teste2', value: 105),
  ];

  List<Transaction> get recentTransactions {
    return transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  void addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    transactions.add(newTransaction);
  }

  void deleteTransaction(Transaction tr) {
    transactions.remove(tr);
  }
}
