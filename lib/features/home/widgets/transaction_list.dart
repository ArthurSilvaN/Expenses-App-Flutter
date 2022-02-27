import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../components/modal.dart';
import '../../../core/usecases/transaction_usecase.dart';
import '../../../core/util/locale_intl.dart';
import '../../../entities/transaction.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  late TransactionUsecase _transactionController;

  @override
  void initState() {
    super.initState();
    _transactionController =
        Provider.of<TransactionUsecase>(context, listen: false);
  }

  void _openDeleteTransactionModal(BuildContext context, Transaction tr) {
    ModalDeleteTransaction(tr).info(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ValueListenableBuilder(
        valueListenable: _transactionController.transactionsListenable,
        builder: (_, __, ___) {
          return _transactionController.transactions.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.locale().noTransactions,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: _transactionController.transactions.length,
                  itemBuilder: (_, index) {
                    final tr = _transactionController.transactions[index];
                    return InkWell(
                      onLongPress: () =>
                          _openDeleteTransactionModal(context, tr),
                      child: Card(
                        elevation: 7,
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        child: ListTile(
                          visualDensity: VisualDensity.compact,
                          leading: Icon(
                            tr.category!.icon,
                            color: tr.category!.color,
                            size: 30,
                          ),
                          title: Text(
                            tr.title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          subtitle: Text(
                            DateFormat(context.locale().dateFormatAbrevMonth)
                                .format(tr.date),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.all(6),
                            child: FittedBox(
                              child: Text(
                                context.locale().valueTransaction(
                                      tr.value.toStringAsFixed(2),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
