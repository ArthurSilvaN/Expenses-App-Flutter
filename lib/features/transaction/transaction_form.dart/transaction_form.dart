import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../components/input_text.dart';
import '../../../components/label_buttons.dart';
import '../../../core/usecases/transaction_usecase.dart';
import '../../../core/util/locale_intl.dart';
import '../../../entities/transaction_categorys.dart';
import '../../../services/auth_service.dart';

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
  late final AuthService _authService =
      Provider.of<AuthService>(context, listen: false);

  void _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    _transactionController.addTransaction(
      userId: _authService.user!.id,
      title: title,
      value: value,
      date: _selectedDate,
      category: _selectedCategory,
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              InputText(
                controller: _titleController,
                label: context.locale().title,
                icon: Icons.description_outlined,
              ),
              InputText(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: _valueController,
                label: context.locale().price,
                icon: FontAwesomeIcons.wallet,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: AnimatedCard(
                  child: Column(
                    children: [
                      SizedBox(
                        child: InputDecorator(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            icon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                FaIcon(
                                  FontAwesomeIcons.calendar,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                              ],
                            ),
                            border: InputBorder.none,
                          ),
                          child: Row(
                            children: [
                              Text(
                                _selectedDate == null
                                    ? context.locale().noDate
                                    : context.locale().selectedDate(DateFormat(
                                            context
                                                .locale()
                                                .dateFormatCompleted)
                                        .format(_selectedDate)),
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
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: AnimatedCard(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: DropdownButton(
                          isExpanded: true,
                          underline: const SizedBox(width: 0),
                          value: _selectedCategory,
                          items: _transactionController.categorysDefault
                              .map<DropdownMenuItem<Category>>(
                            (value) {
                              return DropdownMenuItem<Category>(
                                value: value,
                                child: Row(
                                  children: [
                                    Icon(
                                      value.icon,
                                      size: 30,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(value.name),
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (Category? newValue) {
                            setState(
                              () {
                                _selectedCategory = newValue;
                              },
                            );
                          },
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: context.locale().cancel,
        primaryOnPressed: () => Navigator.pop(context),
        secondaryLabel: context.locale().newTransaction,
        secondaryOnPressed: _submitForm,
        enablePrimaryColor: true,
      ),
    );
  }
}
