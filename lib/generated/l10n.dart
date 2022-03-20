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

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
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

  /// `Charts`
  String get charts {
    return Intl.message(
      'Charts',
      name: 'charts',
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

  /// `Deleted Transaction`
  String get deletedTransaction {
    return Intl.message(
      'Deleted Transaction',
      name: 'deletedTransaction',
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

  /// `MM/dd/y`
  String get dateFormatCompleted {
    return Intl.message(
      'MM/dd/y',
      name: 'dateFormatCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
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

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
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

  /// `Hello, `
  String get hi {
    return Intl.message(
      'Hello, ',
      name: 'hi',
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

  /// `languages`
  String get languages {
    return Intl.message(
      'languages',
      name: 'languages',
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

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
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

  /// `$ {value}`
  String valueTransaction(String value) {
    return Intl.message(
      '\$ $value',
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

  /// `Select Date`
  String get selectDate {
    return Intl.message(
      'Select Date',
      name: 'selectDate',
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

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `teste`
  String get test {
    return Intl.message(
      'teste',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `{transactionsLength} transactions`
  String transactionsLength(int transactionsLength) {
    return Intl.message(
      '$transactionsLength transactions',
      name: 'transactionsLength',
      desc: '',
      args: [transactionsLength],
    );
  }

  /// `Transaction List`
  String get transactionList {
    return Intl.message(
      'Transaction List',
      name: 'transactionList',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to your finance app`
  String get welcome {
    return Intl.message(
      'Welcome to your finance app',
      name: 'welcome',
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
