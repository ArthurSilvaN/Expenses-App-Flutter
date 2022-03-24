import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/usecases/transaction_usecase.dart';
import '../../../../core/util/locale_intl.dart';
import '../../../../entities/transaction.dart';
import '../../../../entities/transaction_categorys.dart';

class TransactionEdit extends StatefulWidget {
  const TransactionEdit({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  State<TransactionEdit> createState() => _TransactionEditState();
}

class _TransactionEditState extends State<TransactionEdit> {
  late final DateTime selectedDate;
  late final Category? selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedDate = transactionOld.date;
    selectedCategory = transactionOld.category;
  }

  late Transaction transactionOld = widget.transaction;
  late final _transactionController =
      Provider.of<TransactionUsecase>(context, listen: false);

  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  void _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title == transactionOld.title &&
        value == transactionOld.value &&
        selectedDate == transactionOld.date) {
      return;
    }

    _transactionController.updateTransaction(transactionOld);

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(
          () {
            selectedDate = pickedDate;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: context.locale().title,
                ),
              ),
              TextFormField(
                controller: _valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: context.locale().price,
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      selectedDate == null
                          ? context.locale().noDate
                          : context.locale().selectedDate(
                              DateFormat(context.locale().dateFormatCompleted)
                                  .format(selectedDate)),
                    ),
                    TextButton(
                      onPressed: _showDatePicker,
                      child: Text(
                        context.locale().selectDate,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: DropdownButton(
                  value: _transactionController.categorysDefault[0],
                  icon: Icon(selectedCategory!.icon),
                  items: _transactionController.categorysDefault.map((value) {
                    return DropdownMenuItem<Category>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                  onChanged: (Category? newValue) {
                    setState(
                      () {
                        selectedCategory = newValue;
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => setState(_submitForm),
                      child: Text(
                        context.locale().edit,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.button?.color,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
