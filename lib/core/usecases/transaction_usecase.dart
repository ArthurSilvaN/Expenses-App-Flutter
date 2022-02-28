import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  late List<CategoryRegistry> categorys = [];
  final DatabaseConneection conneection = DatabaseConneection();

  Future<void> getTransactions() async {
    transactions = await conneection.getTransactions();
    transactionsListenable.notifyListeners();
  }

  Future<void> getCategorys() async {
    categorys = await conneection.getCategorys();
    if (categorys.isEmpty) {
      categorysRegistriesDefault
          .toList()
          .forEach((category) => conneection.insertCategory(category));
    }
    transactionsListenable.notifyListeners();
  }

  late final List<Category> categorysDefault = [
    Category(
      color: Colors.red,
      name: S.current.debts,
      icon: Icons.money_off,
    ),
    Category(
      color: Colors.green,
      name: S.current.investment,
      icon: Icons.savings,
    ),
    Category(
      color: Colors.blue,
      name: S.current.leisure,
      icon: Icons.local_mall_outlined,
    ),
  ];

  late final List<CategoryRegistry> categorysRegistriesDefault = [
    CategoryRegistry(
      color: Colors.red,
      name: S.current.debts,
      value: 0,
    ),
    CategoryRegistry(
      color: Colors.green,
      name: S.current.investment,
      value: 0,
    ),
    CategoryRegistry(
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

  Future<void> addTransaction(
    String title,
    double value,
    DateTime date,
    Category? category,
  ) async {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
      category: category,
    );

    await conneection.insertTransaction(newTransaction);
    transactions.add(newTransaction);

    await getCategorys();

    for (final categoryAdd in categorys) {
      if (categoryAdd.name == category!.name) {
        categoryAdd.value += value;
        await conneection.updateCategory(categoryAdd);
      }
    }
    
    notifyListeners();
  }

  Future<void> deleteTransaction(Transaction tr) async {
    for (final categoryAdd in categorys) {
      if (categoryAdd.name == tr.category!.name) {
        categoryAdd.value -= tr.value;
        await conneection.updateCategory(categoryAdd);
      }
    }

    transactions.remove(tr);
    conneection.deleteTransactionById(tr.id);

    transactionsListenable.notifyListeners();
  }
}
