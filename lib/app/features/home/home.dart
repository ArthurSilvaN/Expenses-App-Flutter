import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/mediaquery_contex.dart';
import '../../shared/providers/home_controller.dart';
import 'components/app_bar.dart';
import 'components/drawer.dart';
import 'components/floating_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, child) => Scaffold(
        key: controller.globalKey,
        endDrawer: const DrawerHome(),
        floatingActionButton: const FloatingButtonFinancy(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(context.sizeContext().height * 0.15),
          child: const AppBarFinancy(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: controller.getBottomBarItems(context),
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
