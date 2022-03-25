part of '../app.dart';

final _providersList = [
  ChangeNotifierProvider(create: (context) => TransactionProvider()),
  ChangeNotifierProvider(create: (context) => LocaleProvider()),
  ChangeNotifierProvider(create: (context) => AuthProvider()),
  ChangeNotifierProvider(create: (context) => HomeController(context)),
  ChangeNotifierProvider(create: (context) => SplashController(context)),
].toList();
