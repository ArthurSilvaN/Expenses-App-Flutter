import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../transaction/transaction_charts/transaction_chart_page.dart';
import '../transaction/transaction_list/transaction_list_page.dart';

class HomeController extends ChangeNotifier {
  HomeController();

  CarouselController buttonCarouselController = CarouselController();
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  bool isDarkModeEnabled = false;

  late final pages = [
    const TransactionListPage(),
    ChartsPage(globalKey: globalKey),
  ];

  List<BottomNavigationBarItem> btmNavbarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.list_alt, size: 40),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.insert_chart_outlined_sharp, size: 40),
    ),
  ];

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
