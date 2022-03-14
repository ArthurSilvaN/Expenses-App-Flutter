import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../components/modal.dart';
import '../../../core/usecases/transaction_usecase.dart';
import '../../../core/util/locale_intl.dart';
import '../../../entities/transaction.dart';
import 'transaction_page.dart';

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

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  Widget _showDismissibleDeletePane(Transaction tr) {
    return DismissiblePane(
      onDismissed: () {
        _showSnackBar('Transação Deletada', Colors.red);
        _transactionController.deleteTransaction(tr);
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
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
                    return OpenContainer(
                      closedElevation: 0,
                      transitionDuration: const Duration(milliseconds: 1000),
                      closedBuilder: (context, action) => Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: tr.category!.color,
                                width: 8.0,
                              ),
                            ),
                          ),
                          child: Slidable(
                            key: Key(tr.id),
                            startActionPane: ActionPane(
                              extentRatio: 0.2,
                              motion: const DrawerMotion(),
                              dismissible: _showDismissibleDeletePane(tr),
                              children: [
                                SlidableAction(
                                  flex: 3,
                                  label: 'Delete',
                                  backgroundColor: tr.category!.color,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  onPressed: (_) =>
                                      _openDeleteTransactionModal(context, tr),
                                ),
                              ],
                            ),
                            child: ListTile(
                              style: ListTileStyle.list,
                              visualDensity: VisualDensity.compact,
                              leading: Icon(
                                tr.category!.icon,
                                size: 30,
                              ),
                              title: Text(
                                tr.title,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              subtitle: Text(
                                DateFormat(
                                        context.locale().dateFormatAbrevMonth)
                                    .format(tr.date),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Text(context.locale().valueTransaction(
                                    tr.value.toStringAsFixed(2))),
                              ),
                            ),
                          ),
                        ),
                      ),
                      openBuilder: (context, action) => Scaffold(
                        body: Center(
                          child: TransactionPage(transaction: tr),
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
