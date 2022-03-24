import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  late final size = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, child) => Scaffold(
        key: controller.globalKey,
        endDrawer: const DrawerHome(),
        floatingActionButton: FloatingButtonFinancy(homeContext: context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.15),
          child: AppBarFinancy(globalKey: controller.globalKey),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: controller.btmNavbarItems,
          currentIndex: controller.currentPage,
          onTap: (index) => controller.setPage(index),
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: controller.pages[controller.currentPage],
        ),
      ),
    );
  }
}
