// ignore_for_file: depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../services/database_connection.dart';
import '../../shared/providers/auth_provider.dart';
import '../../shared/providers/locale_provider.dart';
import '../../shared/providers/transaction_provider.dart';
import '../login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreeState createState() => SplashScreeState();
}

class SplashScreeState extends State<SplashScreen> {
  late final TransactionUsecase _transactionController =
      Provider.of<TransactionUsecase>(context, listen: false);

  late final LocaleProvider _localeController =
      Provider.of<LocaleProvider>(context, listen: false);

  late final DatabaseConneection conneection = DatabaseConneection();

  late final AuthProvider _authService =
      Provider.of<AuthProvider>(context, listen: false);

  Future<void> _initializeApp() async {
    await _authService.setUser();

    if (_authService.user != null)
      await conneection.inializeDatabase().then(
        (value) {
          _transactionController.getDataUser(_authService.user!.id);
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
        return const LoginPage();
      },
      curve: Curves.linear,
      pageTransitionType: PageTransitionType.fade,
      duration: 5000,
      splashIconSize: MediaQuery.of(context).size.height,
      animationDuration: const Duration(seconds: 3),
      centered: false,
      splashTransition: SplashTransition.fadeTransition,
      splash: 'assets/images/splash.png',
    );
  }
}
