part of '../app.dart';

final _providersList = [
  ChangeNotifierProvider(create: (context) => TransactionUsecase()),
  ChangeNotifierProvider(create: (context) => LocaleUseCase()),
  ChangeNotifierProvider(create: (context) => AuthService()),
  ChangeNotifierProvider(create: (context) => HomeController()),
].toList();
