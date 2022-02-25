// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Category Chart`
  String get categoryChart {
    return Intl.message(
      'Category Chart',
      name: 'categoryChart',
      desc: '',
      args: [],
    );
  }

  /// `Debts`
  String get debts {
    return Intl.message(
      'Debts',
      name: 'debts',
      desc: '',
      args: [],
    );
  }

  /// `MMM d y`
  String get dateFormatAbrevMonth {
    return Intl.message(
      'MMM d y',
      name: 'dateFormatAbrevMonth',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get delete {
    return Intl.message(
      'delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete transaction {title} with the value off R${value}?`
  String deleteTransaction(String title, String value) {
    return Intl.message(
      'Delete transaction $title with the value off R\$$value?',
      name: 'deleteTransaction',
      desc: '',
      args: [title, value],
    );
  }

  /// `Expenses Week`
  String get expensesWeek {
    return Intl.message(
      'Expenses Week',
      name: 'expensesWeek',
      desc: '',
      args: [],
    );
  }

  /// `Investment`
  String get investment {
    return Intl.message(
      'Investment',
      name: 'investment',
      desc: '',
      args: [],
    );
  }

  /// `Leisure`
  String get leisure {
    return Intl.message(
      'Leisure',
      name: 'leisure',
      desc: '',
      args: [],
    );
  }

  /// `My Transactions`
  String get myTransactions {
    return Intl.message(
      'My Transactions',
      name: 'myTransactions',
      desc: '',
      args: [],
    );
  }

  /// `New Transaction`
  String get newTransaction {
    return Intl.message(
      'New Transaction',
      name: 'newTransaction',
      desc: '',
      args: [],
    );
  }

  /// `No Registered Transaction!`
  String get noTransactions {
    return Intl.message(
      'No Registered Transaction!',
      name: 'noTransactions',
      desc: '',
      args: [],
    );
  }

  /// `{value}`
  String valueTransaction(String value) {
    return Intl.message(
      '$value',
      name: 'valueTransaction',
      desc: '',
      args: [value],
    );
  }

  /// `No Selected Date!`
  String get noDate {
    return Intl.message(
      'No Selected Date!',
      name: 'noDate',
      desc: '',
      args: [],
    );
  }

  /// `Personal Expenses`
  String get personalExpenses {
    return Intl.message(
      'Personal Expenses',
      name: 'personalExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Value $`
  String get price {
    return Intl.message(
      'Value \$',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Selected Date: {selectedDate}`
  String selectedDate(String selectedDate) {
    return Intl.message(
      'Selected Date: $selectedDate',
      name: 'selectedDate',
      desc: '',
      args: [selectedDate],
    );
  }

  /// ` {transactionsLength} transactions`
  String transactionsLength(int transactionsLength) {
    return Intl.message(
      ' $transactionsLength transactions',
      name: 'transactionsLength',
      desc: '',
      args: [transactionsLength],
    );
  }

  /// `Select Date`
  String get selectDate {
    return Intl.message(
      'Select Date',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
