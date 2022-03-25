import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/util/mediaquery_contex.dart';
import '../../../shared/providers/home_controller.dart';
import 'widgets/transaction_category_chart.dart';
import 'widgets/transaction_chart.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({Key? key}) : super(key: key);

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            CarouselSlider(
              items: const [
                Center(child: TransactionChart()),
                Center(child: CategoryChart()),
              ],
              options: CarouselOptions(
                height: context.sizeContext().height * 0.55,
                viewportFraction: 1,
              ),
              carouselController: controller.buttonCarouselController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () =>
                      controller.buttonCarouselController.previousPage(
                    duration: const Duration(milliseconds: 300),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_left),
                ),
                IconButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () => controller.buttonCarouselController.nextPage(
                    duration: const Duration(milliseconds: 300),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
