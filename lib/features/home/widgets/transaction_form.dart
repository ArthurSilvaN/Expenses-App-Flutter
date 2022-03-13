import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/usecases/transaction_usecase.dart';
import '../../../core/util/locale_intl.dart';
import '../../../entities/transaction_categorys.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  late final _transactionController =
      Provider.of<TransactionUsecase>(context, listen: false);
      
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();
  late Category? _selectedCategory = _transactionController.categorysDefault[0];

  void _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    _transactionController.addTransaction(
      title,
      value,
      _selectedDate,
      _selectedCategory,
    );

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(
          () {
            _selectedDate = pickedDate;
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
              TextField(
                controller: _titleController,
                onSubmitted: (_) => setState(_submitForm),
                decoration: InputDecoration(
                  labelText: context.locale().title,
                ),
              ),
              TextField(
                controller: _valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => setState(_submitForm),
                decoration: InputDecoration(
                  labelText: context.locale().price,
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      _selectedDate == null
                          ? context.locale().noDate
                          : context.locale().selectedDate(
                              DateFormat('dd/MM/y').format(_selectedDate)),
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
                  value: _selectedCategory,
                  icon: Icon(_selectedCategory!.icon),
                  items: _transactionController.categorysDefault
                      .map<DropdownMenuItem<Category>>((value) {
                    return DropdownMenuItem<Category>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                  onChanged: (Category? newValue) {
                    setState(
                      () {
                        _selectedCategory = newValue;
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
                        context.locale().newTransaction,
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
