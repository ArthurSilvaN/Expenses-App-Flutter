import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  HomeController();

  int currentPage = 0;

  void setPage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
