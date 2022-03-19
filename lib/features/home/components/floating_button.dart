import 'package:flutter/material.dart';

import '../../transaction/transaction_form.dart/transaction_form.dart';

class FloatingButtonFinancy extends StatelessWidget {
  const FloatingButtonFinancy({Key? key, required this.homeContext})
      : super(key: key);

  final BuildContext homeContext;

  @override
  Widget build(context) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => _openTransactionFormModal(),
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.add_box_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openTransactionFormModal() {
    showModalBottomSheet(
      context: homeContext,
      builder: (_) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(homeContext).viewInsets.bottom),
          child: const TransactionForm(),
        );
      },
    );
  }
}
