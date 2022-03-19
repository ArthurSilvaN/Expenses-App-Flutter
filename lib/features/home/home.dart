import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../charts/charts_page.dart';
import '../transaction_list/transaction_list_page.dart';
import 'components/app_bar.dart';
import 'components/drawer.dart';
import 'components/floating_button.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeController controller =
      Provider.of<HomeController>(context, listen: false);

  CarouselController buttonCarouselController = CarouselController();

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  late final size = MediaQuery.of(context).size;

  late final _pages = [
    const TransactionListPage(),
    ChartsPage(globalKey: globalKey),
  ];

  static const _btmNavbarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.list_alt, size: 40),
      label: 'Transaction List',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.insert_chart_outlined_sharp, size: 40),
      label: 'Charts',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      endDrawer: const DrawerHome(),
      floatingActionButton: FloatingButtonFinancy(homeContext: context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.15),
        child: AppBarFinancy(globalKey: globalKey),
      ),
      bottomNavigationBar: Consumer<HomeController>(
        builder: (context, value, child) => BottomNavigationBar(
          items: _btmNavbarItems,
          currentIndex: controller.currentPage,
          onTap: (index) => controller.setPage(index),
        ),
      ),
      body: Consumer<HomeController>(
        builder: (context, value, child) {
          return PageTransitionSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: _pages[controller.currentPage],
          );
        },
      ),
    );
  }
}
