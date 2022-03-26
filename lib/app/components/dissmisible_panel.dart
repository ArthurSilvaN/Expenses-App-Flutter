import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../core/util/locale_intl.dart';
import '../entities/transaction.dart';
import '../shared/providers/transaction_provider.dart';
import 'snackbar.dart';

Widget showDismissibleDeletePane(Transaction tr, BuildContext context) {
  return Consumer<TransactionProvider>(
    builder: (context, controller, child) => DismissiblePane(
      onDismissed: () {
        SnackBarFinancy(context).showSnackBar(
          message: context.locale().deletedTransaction,
          color: Colors.red,
        );
        controller.deleteTransaction(tr);
      },
      confirmDismiss: () async {
        final bool? ret = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
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
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(context.locale().delete),
                ),
              ],
            );
          },
        );
        return ret ?? false;
      },
    ),
  );
}
