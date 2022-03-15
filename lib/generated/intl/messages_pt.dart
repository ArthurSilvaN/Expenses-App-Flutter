// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  static String m0(title, value) =>
      "Deletar a transação ${title} no valor de R\$${value}?";

  static String m1(selectedDate) => "Data Selecionada: ${selectedDate}";

  static String m2(transactionsLength) => "${transactionsLength} transações";

  static String m3(value) => "R\$ ${value}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Adicionar"),
        "cancel": MessageLookupByLibrary.simpleMessage("cancelar"),
        "categoryChart":
            MessageLookupByLibrary.simpleMessage("Gráfico de Categorias"),
        "dateFormatAbrevMonth": MessageLookupByLibrary.simpleMessage("d MMM y"),
        "dateFormatCompleted": MessageLookupByLibrary.simpleMessage("MM/dd/y"),
        "debts": MessageLookupByLibrary.simpleMessage("Dividas"),
        "delete": MessageLookupByLibrary.simpleMessage("deletar"),
        "deleteTransaction": m0,
        "deletedTransaction":
            MessageLookupByLibrary.simpleMessage("Transação Deletada"),
        "edit": MessageLookupByLibrary.simpleMessage("editar"),
        "expensesWeek":
            MessageLookupByLibrary.simpleMessage("Gastos da semana"),
        "hi": MessageLookupByLibrary.simpleMessage("Olá, "),
        "investment": MessageLookupByLibrary.simpleMessage("Investimento"),
        "leisure": MessageLookupByLibrary.simpleMessage("Lazer"),
        "myTransactions":
            MessageLookupByLibrary.simpleMessage("Minhas Transações"),
        "newTransaction":
            MessageLookupByLibrary.simpleMessage("Nova Transação"),
        "noDate":
            MessageLookupByLibrary.simpleMessage("Nenhuma data selecionada!"),
        "noTransactions": MessageLookupByLibrary.simpleMessage(
            "Nenhuma Transação Cadastrada!"),
        "personalExpenses":
            MessageLookupByLibrary.simpleMessage("Despesas Pessoais"),
        "price": MessageLookupByLibrary.simpleMessage("Valor (R\$)"),
        "selectDate": MessageLookupByLibrary.simpleMessage("Selecionar Data"),
        "selectedDate": m1,
        "test": MessageLookupByLibrary.simpleMessage("teste"),
        "title": MessageLookupByLibrary.simpleMessage("Título"),
        "transactionsLength": m2,
        "valueTransaction": m3,
        "welcome": MessageLookupByLibrary.simpleMessage(
            "Bem vindo ao seu app de finanças")
      };
}
