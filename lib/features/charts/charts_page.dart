import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/usecases/transaction_usecase.dart';
import '../../core/util/locale_intl.dart';
import '../home/widgets/transaction_list.dart';

class TransactionListPage extends StatefulWidget {
  const TransactionListPage({Key? key}) : super(key: key);

  @override
  State<TransactionListPage> createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  late final TransactionUsecase _transactionController =
      Provider.of<TransactionUsecase>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.locale().myTransactions,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    context.locale().transactionsLength(
                          _transactionController.transactions.length,
                        ),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
            ),
            const TransactionList(),
          ],
        ),
      ),
    );
  }
}
