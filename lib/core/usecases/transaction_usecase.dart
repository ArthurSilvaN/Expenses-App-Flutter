import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../entities/category_registry.dart';
import '../../entities/transaction.dart';
import '../../entities/transaction_categorys.dart';
import '../../entities/transaction_registry.dart';
import '../../generated/l10n.dart';
import '../../services/database_connection.dart';
import '../util/property_value_notifier.dart';

class TransactionUsecase extends ChangeNotifier {
  TransactionUsecase();

  late PropertyValueNotifier<List<Transaction>?> transactionsListenable =
      PropertyValueNotifier(transactions);

  late List<Transaction> transactions = [];
  final DatabaseConneection conneection = DatabaseConneection();

  Future<void> getDataUser(String userId) async {
    await getTransactions(userId);
    getCategorysRegistrys();
  }

  Future<void> getTransactions(String userId) async {
    transactions = await conneection.getTransactions(userId);
    transactionsListenable.notifyListeners();
  }

  late List<Category> categorysDefault = [
    Category(
      id: 'debts',
      color: Colors.red,
      name: S.current.debts,
      icon: Icons.money_off,
    ),
    Category(
      id: 'investment',
      color: Colors.green,
      name: S.current.investment,
      icon: Icons.savings,
    ),
    Category(
      id: 'leisure',
      color: Colors.blue,
      name: S.current.leisure,
      icon: Icons.local_mall_outlined,
    ),
  ];

  late final List<CategoryRegistry> categorysRegistriesDefault = [
    CategoryRegistry(
      id: 'debts',
      color: Colors.red,
      name: S.current.debts,
      value: 0,
    ),
    CategoryRegistry(
      id: 'investment',
      color: Colors.green,
      name: S.current.investment,
      value: 0,
    ),
    CategoryRegistry(
      id: 'leisure',
      color: Colors.blue,
      name: S.current.leisure,
      value: 0,
    ),
  ];

  List<Transaction> get recentTransactions {
    return transactions.where((tr) {
      return tr.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void getCategorysRegistrys() {
    for (final transaction in transactions) {
      for (final categoryAdd in categorysRegistriesDefault) {
        if (categoryAdd.id == transaction.category!.id) {
          categoryAdd.value += transaction.value;
        }
      }
    }
  }

  List<TransactionRegistry> get groupedTransactions {
    final transactionList = <TransactionRegistry>[];

    List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        final bool sameDay = recentTransactions[i].date.day == weekDay.day;
        final bool sameMonth =
            recentTransactions[i].date.month == weekDay.month;
        final bool sameYear = recentTransactions[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransactions[i].value;
        }
      }

      transactionList.add(
        TransactionRegistry(totalSum, DateFormat('EEE').format(weekDay)),
      );
    }).reversed.toList();

    return transactionList;
  }

  Future<void> addTransaction({
    required String title,
    required double value,
    required DateTime date,
    required Category? category,
    required String userId,
  }) async {
    final newTransaction = Transaction(
      userId: userId,
      id: const Uuid().v4(),
      title: title,
      value: value,
      date: date,
      category: category,
    );

    await conneection.insertTransaction(newTransaction);
    transactions.add(newTransaction);

    for (final categoryAdd in categorysRegistriesDefault) {
      if (categoryAdd.id == category!.id) {
        categoryAdd.value += value;
      }
    }

    transactionsListenable.notifyListeners();
    notifyListeners();
  }

  Future<void> deleteTransaction(Transaction tr) async {
    for (final categoryAdd in categorysRegistriesDefault) {
      if (categoryAdd.id == tr.category!.id) {
        categoryAdd.value -= tr.value;
      }
    }

    transactions.remove(tr);
    conneection.deleteTransactionById(tr.id);

    transactionsListenable.notifyListeners();
    notifyListeners();
  }
}
