import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/usecases/transacion_usecase.dart';
import '../../../models/category_registry.dart';
import '../../../models/transaction.dart';

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
            legend: Legend(
              isVisible: true,
            ),
            series: [
              PieSeries<CategoryRegistry, String>(
                dataSource: _transactionController.groupedCategory,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
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
