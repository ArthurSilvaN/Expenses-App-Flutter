import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../transaction/transaction_charts/transaction_chart_page.dart';
import '../transaction/transaction_list/transaction_list.dart';

class HomeController extends ChangeNotifier {
  HomeController();

  CarouselController buttonCarouselController = CarouselController();
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  late final pages = [
    const TransactionListPage(),
    ChartsPage(globalKey: globalKey),
  ];

  static const btmNavbarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.list_alt, size: 40),
      label: 'Transaction List',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.insert_chart_outlined_sharp, size: 40),
      label: 'Charts',
    ),
  ];

  int currentPage = 0;

  void setPage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
