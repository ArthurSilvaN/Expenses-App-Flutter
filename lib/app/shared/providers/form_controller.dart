import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/date_picker.dart';
import '../../components/snackbar.dart';
import '../../entities/transaction_categorys.dart';
import 'auth_provider.dart';
import 'transaction_provider.dart';

class FormController extends ChangeNotifier {
  FormController(this.context)
      : transactionProvider =
            Provider.of<TransactionProvider>(context, listen: false),
        auth = Provider.of<AuthProvider>(context, listen: false);

  final BuildContext context;
  final TransactionProvider transactionProvider;
  final AuthProvider auth;

  final titleController = TextEditingController();
  final valueController = TextEditingController();
  late DateTime selectedDate = DateTime.now();
  late Category? selectedCategory = transactionProvider.categorysDefault[0];

  void submitForm(BuildContext context) {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || selectedDate == null) {
      title.isEmpty
          ? SnackBarFinancy(context).showSnackBar(
              message: 'Titulo não pode ser vazio',
              color: Colors.red,
            )
          : value <= 0
              ? SnackBarFinancy(context).showSnackBar(
                  message: 'Valor não pode ser vazio ou negativo',
                  color: Colors.red,
                )
              : SnackBarFinancy(context).showSnackBar(
                  message: 'Erro Inesperado',
                  color: Colors.red,
                );

      notifyListeners();
      return;
    }

    transactionProvider.addTransaction(
      userId: auth.user!.id,
      title: title,
      value: value,
      date: selectedDate,
      category: selectedCategory,
    );

    SnackBarFinancy(context).showSnackBar(
      message: 'Transação Cadastrada',
      color: Colors.green,
    );

    clear();
    notifyListeners();
    Navigator.of(context).pop();
  }

  Future<void> getDate(BuildContext context) async {
    selectedDate = (await showDatePickerFinancy(context))!;
    notifyListeners();
  }

  void setCategory(Category? category) {
    selectedCategory = category;
    notifyListeners();
  }

  void clear() {
    titleController.clear();
    valueController.clear();
    selectedDate = DateTime.now();
    selectedCategory = transactionProvider.categorysDefault[0];
  }
}
