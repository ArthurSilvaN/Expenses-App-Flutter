// ignore_for_file: depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../core/usecases/locale_usecase.dart';
import '../../core/usecases/transaction_usecase.dart';
import '../../services/database_connection.dart';
import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreeState createState() => SplashScreeState();
}

class SplashScreeState extends State<SplashScreen> {
  late final TransactionUsecase _transactionController =
      Provider.of<TransactionUsecase>(context, listen: false);

  late final LocaleUseCase _localeController =
      Provider.of<LocaleUseCase>(context, listen: false);

  late final DatabaseConneection conneection = DatabaseConneection();

  Future<void> _initializeApp() async {
    await conneection.inializeDatabase().then(
      (value) {
        _transactionController.getTransactions();
        _transactionController.getCategorys();
      },
    );
    Future.delayed(Duration.zero, () {
      _localeController.setLocale(Localizations.localeOf(context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      screenFunction: () async {
        await _initializeApp();
        return const HomePage();
      },
      curve: Curves.linear,
      pageTransitionType: PageTransitionType.fade,
      duration: 7000,
      splashIconSize: MediaQuery.of(context).size.height,
      animationDuration: const Duration(seconds: 3),
      centered: false,
      splashTransition: SplashTransition.fadeTransition,
      splash: 'assets/images/splash.png',
    );
  }
}
