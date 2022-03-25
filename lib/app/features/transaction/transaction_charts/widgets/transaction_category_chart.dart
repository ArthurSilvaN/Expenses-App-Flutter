import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/util/locale_intl.dart';
import '../../../../entities/category_registry.dart';
import '../../../../shared/providers/transaction_provider.dart';

class CategoryChart extends StatefulWidget {
  const CategoryChart({Key? key}) : super(key: key);

  @override
  CategoryChartState createState() => CategoryChartState();
}

class CategoryChartState extends State<CategoryChart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionUsecase>(
      builder: (context, controller, child) => Center(
        child: SfCircularChart(
          title: ChartTitle(
            text: context.locale().categoryChart,
            textStyle: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            ),
          ),
          legend: Legend(
            isVisible: true,
          ),
          series: [
            RadialBarSeries<CategoryRegistry, String>(
              dataSource: controller.categorysRegistriesDefault
                  .where((element) => element.value != 0)
                  .toList(),
              opacity: 0.8,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                useSeriesColor: true,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
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
      ),
    );
  }
}
