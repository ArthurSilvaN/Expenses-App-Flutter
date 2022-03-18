import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/usecases/transaction_usecase.dart';
import '../../../core/util/locale_intl.dart';
import '../../../entities/category_registry.dart';

class CategoryChart extends StatefulWidget {
  const CategoryChart({Key? key}) : super(key: key);

  @override
  CategoryChartState createState() => CategoryChartState();
}

class CategoryChartState extends State<CategoryChart> {
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
          child: SfCircularChart(
            title: ChartTitle(text: context.locale().categoryChart),
            legend: Legend(
              isVisible: true,
            ),
            series: [
              RadialBarSeries<CategoryRegistry, String>(
                dataSource: _transactionController.categorysRegistriesDefault
                    .where((element) => element.value != 0)
                    .toList(),
                opacity: 0.8,
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  useSeriesColor: true,
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                pointColorMapper: (data, _) => data.color,
                sortingOrder: SortingOrder.ascending,
                sortFieldValueMapper: (data, _) => data.name,
                xValueMapper: (data, _) => data.name,
                yValueMapper: (data, _) => data.value,
                animationDuration: 1000,
              ),
            ],
          ),
        );
      },
    );
  }
}
