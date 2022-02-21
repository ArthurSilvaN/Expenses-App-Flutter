import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/usecases/transacion_usecase.dart';
import '../../../models/transaction_registry.dart';

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
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              majorGridLines: const MajorGridLines(width: 0),
              minorTickLines: const MinorTickLines(width: 0),
            ),
            title: ChartTitle(
              text: 'Gastos da semana',
            ),
            series: [
              ColumnSeries<TransactionRegistry, String>(
                color: Theme.of(context).colorScheme.primary,
                dataSource: _transactionController.groupedTransactions,
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
        );
      },
    );
  }
}
