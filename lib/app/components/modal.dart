import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/usecases/transaction_usecase.dart';
import '../core/util/locale_intl.dart';
import '../entities/transaction.dart';

class ModalDeleteTransaction {
  ModalDeleteTransaction(this.transaction);

  final Transaction transaction;

  Future<dynamic> info(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  context.locale().deleteTransaction(
                        transaction.title,
                        transaction.value.toStringAsFixed(2),
                      ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _close(context),
                    _confirm(context, transaction),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _close(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Text(
          context.locale().cancel,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _confirm(BuildContext context, Transaction tr) {
    final transactionController =
        Provider.of<TransactionUsecase>(context, listen: false);
    return SizedBox(
      child: ElevatedButton(
        child: Text(
          context.locale().delete,
        ),
        onPressed: () => {
          transactionController.deleteTransaction(tr),
          Navigator.pop(context),
        },
      ),
    );
  }
}
