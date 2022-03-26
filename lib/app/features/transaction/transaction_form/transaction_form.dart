import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../components/input_text.dart';
import '../../../components/label_buttons.dart';
import '../../../core/util/locale_intl.dart';
import '../../../shared/providers/form_controller.dart';
import 'widgets/date_widget.dart';
import 'widgets/dropdown_widget.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormController>(
      builder: (context, controller, child) => Scaffold(
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
                  controller: controller.titleController,
                  label: context.locale().title,
                  icon: Icons.description_outlined,
                ),
                InputText(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: controller.valueController,
                  label: context.locale().price,
                  icon: FontAwesomeIcons.wallet,
                ),
                const DateWidget(),
                const DropdownWidget(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SetLabelButtons(
          primaryLabel: context.locale().cancel,
          primaryOnPressed: () => Navigator.pop(context),
          secondaryLabel: context.locale().newTransaction,
          secondaryOnPressed: () => controller.submitForm(context),
          enablePrimaryColor: true,
        ),
      ),
    );
  }
}
