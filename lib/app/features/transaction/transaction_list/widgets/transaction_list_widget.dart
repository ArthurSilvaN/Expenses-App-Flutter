import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../components/delete_transaction_modal.dart';
import '../../../../components/dissmisible_panel.dart';
import '../../../../core/util/locale_intl.dart';
import '../../../../core/util/mediaquery_contex.dart';
import '../../../../shared/providers/transaction_provider.dart';
import '../../transaction_info/transaction_page.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sizeContext().height * 0.6,
      child: Consumer<TransactionProvider>(
        builder: (context, controller, child) => controller.transactions.isEmpty
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
                itemCount: controller.transactions.length,
                itemBuilder: (_, index) {
                  final tr = controller.transactions[index];
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
                            extentRatio: 0.3,
                            motion: const DrawerMotion(),
                            dismissible: showDismissibleDeletePane(tr, context),
                            children: [
                              SlidableAction(
                                flex: 3,
                                label: context.locale().delete,
                                backgroundColor: tr.category!.color,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                onPressed: (_) =>
                                    openDeleteTransactionModal(tr, context),
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
                              DateFormat(context.locale().dateFormatAbrevMonth)
                                  .format(tr.date),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Text(
                                NumberFormat.simpleCurrency().format(tr.value),
                              ),
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
              ),
      ),
    );
  }
}
