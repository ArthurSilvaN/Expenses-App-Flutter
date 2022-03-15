// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(title, value) =>
      "Delete transaction ${title} with the value off R\$${value}?";

  static String m1(selectedDate) => "Selected Date: ${selectedDate}";

  static String m2(transactionsLength) => "${transactionsLength} transactions";

  static String m3(value) => "\$ ${value}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "categoryChart": MessageLookupByLibrary.simpleMessage("Category Chart"),
        "dateFormatAbrevMonth": MessageLookupByLibrary.simpleMessage("MMM d y"),
        "dateFormatCompleted": MessageLookupByLibrary.simpleMessage("MM/dd/y"),
        "debts": MessageLookupByLibrary.simpleMessage("Debts"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteTransaction": m0,
        "deletedTransaction":
            MessageLookupByLibrary.simpleMessage("Deleted Transaction"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "expensesWeek": MessageLookupByLibrary.simpleMessage("Expenses Week"),
        "hi": MessageLookupByLibrary.simpleMessage("Hello, "),
        "investment": MessageLookupByLibrary.simpleMessage("Investment"),
        "languages": MessageLookupByLibrary.simpleMessage("languages"),
        "leisure": MessageLookupByLibrary.simpleMessage("Leisure"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "myTransactions":
            MessageLookupByLibrary.simpleMessage("My Transactions"),
        "newTransaction":
            MessageLookupByLibrary.simpleMessage("New Transaction"),
        "noDate": MessageLookupByLibrary.simpleMessage("No Selected Date!"),
        "noTransactions":
            MessageLookupByLibrary.simpleMessage("No Registered Transaction!"),
        "personalExpenses":
            MessageLookupByLibrary.simpleMessage("Personal Expenses"),
        "price": MessageLookupByLibrary.simpleMessage("Value \$"),
        "selectDate": MessageLookupByLibrary.simpleMessage("Select Date"),
        "selectedDate": m1,
        "test": MessageLookupByLibrary.simpleMessage("teste"),
        "title": MessageLookupByLibrary.simpleMessage("Title"),
        "transactionsLength": m2,
        "valueTransaction": m3,
        "welcome":
            MessageLookupByLibrary.simpleMessage("Welcome to your finance app")
      };
}
