import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    conneection.inializeDatabase().then(
      (value) {
        _transactionController.getTransactions();
        _transactionController.getCategorys();
      },
    );
    _localeController.setLocale(Localizations.localeOf(context));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      function: _initializeApp,
      splash: Image.asset(
        'assets/images/logo1.png',
        width: 300,
        height: 100,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      duration: 7000,
      nextScreen: const HomePage(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
