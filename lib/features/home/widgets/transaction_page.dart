import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../components/input_text.dart' show InputText;
import '../../../components/label_buttons.dart';
import '../../../core/util/locale_intl.dart';
import '../../../entities/transaction.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late TextEditingController _titleController;
  late TextEditingController _valueController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.transaction.title);
    _valueController =
        TextEditingController(text: widget.transaction.value.toString());
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
                controller: _valueController,
                label: context.locale().price,
                icon: FontAwesomeIcons.wallet,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: context.locale().cancel,
        primaryOnPressed: () {
          Navigator.pop(context);
        },
        secondaryLabel: context.locale().edit,
        secondaryOnPressed: () async {
          Navigator.pop(context);
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
