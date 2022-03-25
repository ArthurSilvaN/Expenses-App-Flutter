import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/util/locale_intl.dart';
import '../../../../core/util/mediaquery_contex.dart';
import '../../../../entities/transaction_registry.dart';
import '../../../../shared/providers/transaction_provider.dart';

class TransactionChart extends StatefulWidget {
  const TransactionChart({Key? key}) : super(key: key);

  @override
  TransactionChartState createState() => TransactionChartState();
}

class TransactionChartState extends State<TransactionChart> {
  late TransactionUsecase _transactionController;

  @override
  void initState() {
    super.initState();
    _transactionController =
        Provider.of<TransactionUsecase>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _transactionController.transactionsListenable,
      builder: (_, __, ___) {
        return Center(
          child: SizedBox(
            width: context.sizeContext().width * 0.8,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                majorGridLines: const MajorGridLines(width: 0),
                minorTickLines: const MinorTickLines(width: 0),
              ),
              title: ChartTitle(
                text: context.locale().expensesWeek,
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
              series: [
                ColumnSeries<TransactionRegistry, String>(
                  color: Theme.of(context).colorScheme.primary,
                  dataSource: _transactionController
                      .groupedTransactions.reversed
                      .toList(),
                  sortFieldValueMapper: (tr, _) => tr.date,
                  xValueMapper: (tr, _) => tr.date,
                  yValueMapper: (tr, _) => tr.value,
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Colors.deepOrange[600]!,
                    ],
                  ),
                  markerSettings: const MarkerSettings(isVisible: true),
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    showZeroValue: false,
                  ),
                  enableTooltip: true,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
