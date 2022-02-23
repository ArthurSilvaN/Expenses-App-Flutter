import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/category_registry.dart';
import '../../models/transaction.dart';
import '../../models/transaction_categorys.dart';
import '../../models/transaction_registry.dart';
import '../util/property_value_notifier.dart';

class TransactionUsecase extends ChangeNotifier {
  TransactionUsecase();

  late PropertyValueNotifier<List<Transaction>?> transactionsListenable =
      PropertyValueNotifier(transactions);

  List<Transaction> transactions = [];

  late final List<Category> categorysDefault = [
    Category(
      color: Colors.red,
      name: 'Dividas',
      icon: Icons.access_alarms,
    ),
    Category(
      color: Colors.green,
      name: 'Investimento',
      icon: Icons.attach_money_rounded,
    ),
    Category(
      color: Colors.blue,
      name: 'Lazer',
      icon: Icons.access_alarms,
    ),
  ];

  late final List<CategoryRegistry> categorysRegistriesDefault = [
    CategoryRegistry(
      color: Colors.red,
      name: 'Dividas',
      value: 0,
    ),
    CategoryRegistry(
      color: Colors.green,
      name: 'Investimento',
      value: 0,
    ),
    CategoryRegistry(
      color: Colors.blue,
      name: 'Lazer',
      value: 0,
    ),
  ];

  List<Transaction> get recentTransactions {
    return transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
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

  void addTransaction(
    String title,
    double value,
    DateTime date,
    Category? category,
  ) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
      category: category,
    );

    transactions.add(newTransaction);

    for (final e in categorysRegistriesDefault) {
      {
        if (e.name == category!.name) {
          e.value += value;
        }
      }
    }

    transactionsListenable.notifyListeners();
  }

  void deleteTransaction(Transaction tr) {
    transactions.remove(tr);
    transactionsListenable.notifyListeners();
    return;
  }
}
