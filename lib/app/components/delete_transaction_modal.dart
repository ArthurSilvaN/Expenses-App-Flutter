import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/util/locale_intl.dart';
import '../entities/transaction.dart';
import '../shared/providers/transaction_provider.dart';
import 'snackbar.dart';

void openDeleteTransactionModal(Transaction tr, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Consumer<TransactionProvider>(
        builder: (context, controller, child) => AlertDialog(
          title: Text(context.locale().delete.toUpperCase()),
          content: Text(
            context.locale().deleteTransaction(
                  tr.title,
                  tr.value.toString(),
                ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(context.locale().cancel),
            ),
            TextButton(
              onPressed: () {
                SnackBarFinancy(context: context).showSnackBar(
                  message: context.locale().deletedTransaction,
                  color: Colors.red,
                );
                controller.deleteTransaction(tr);
                Navigator.pop(context);
              },
              child: Text(context.locale().delete),
            ),
          ],
        ),
      );
    },
  );
}
