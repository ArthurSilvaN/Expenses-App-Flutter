import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../core/util/locale_intl.dart';
import '../../features/transaction/transaction_charts/transaction_chart_page.dart';
import '../../features/transaction/transaction_list/transaction_list_page.dart';

class HomeController extends ChangeNotifier {
  HomeController(this.context);

  final BuildContext context;

  CarouselController buttonCarouselController = CarouselController();
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  bool isDarkModeEnabled = false;

  late final pages = [
    const TransactionListPage(),
    const ChartsPage(),
  ];

  List<BottomNavigationBarItem> getBottomBarItems(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.list_alt, size: 40),
        label: context.locale().transactionList,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.insert_chart_outlined_sharp, size: 40),
        label: context.locale().charts,
      ),
    ];
  }

  int currentPage = 0;

  void setPage(int index) {
    currentPage = index;
    notifyListeners();
  }

  void onStateChanged(bool isDarkModeEnabled) {
    this.isDarkModeEnabled = isDarkModeEnabled;
    notifyListeners();
  }
}
