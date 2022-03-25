part of '../app.dart';

final _providersList = [
  ChangeNotifierProvider(create: (context) => TransactionUsecase()),
  ChangeNotifierProvider(create: (context) => LocaleProvider()),
  ChangeNotifierProvider(create: (context) => AuthProvider()),
  ChangeNotifierProvider(create: (context) => HomeController()),
].toList();
