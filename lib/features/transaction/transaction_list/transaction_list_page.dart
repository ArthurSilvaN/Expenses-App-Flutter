import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../transaction_charts/widgets/transaction_category_chart.dart';
import '../transaction_charts/widgets/transaction_chart.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({Key? key, required this.globalKey}) : super(key: key);

  final GlobalKey globalKey;

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  late final size = MediaQuery.of(context).size;

  late final globalKey = widget.globalKey;

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          CarouselSlider(
            items: const [
              Center(child: TransactionChart()),
              Center(child: CategoryChart()),
            ],
            options: CarouselOptions(
              height: size.height * 0.4,
              viewportFraction: 1,
            ),
            carouselController: buttonCarouselController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => buttonCarouselController.previousPage(
                  duration: const Duration(milliseconds: 300),
                ),
                icon: const Icon(Icons.keyboard_arrow_left),
              ),
              IconButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => buttonCarouselController.nextPage(
                    duration: const Duration(milliseconds: 300)),
                icon: const Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
