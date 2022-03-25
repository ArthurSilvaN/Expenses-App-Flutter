// ignore_for_file: depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../core/util/mediaquery_contex.dart';
import '../../shared/providers/splash_controller.dart';
import '../login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreeState createState() => SplashScreeState();
}

class SplashScreeState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SplashController>(
      builder: (context, controller, child) {
        return AnimatedSplashScreen.withScreenFunction(
          screenFunction: () async {
            await controller.initializeApp();
            return const LoginPage();
          },
          curve: Curves.linear,
          pageTransitionType: PageTransitionType.fade,
          duration: 5000,
          splashIconSize: context.sizeContext().height,
          animationDuration: const Duration(seconds: 3),
          centered: false,
          splashTransition: SplashTransition.fadeTransition,
          splash: 'assets/images/splash.png',
        );
      },
    );
  }
}
