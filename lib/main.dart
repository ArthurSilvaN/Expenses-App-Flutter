import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/usecases/locale_usecase.dart';
import 'core/usecases/transaction_usecase.dart';
import 'features/home/home.dart';
import 'theme/style.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    ChangeNotifierProvider(
      create: (_) => LocaleUseCase(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider(
          create: (context) => TransactionUsecase(),
        ),
        Provider(
          create: (context) => LocaleUseCase(),
        )
      ],
      child: MaterialApp(
        scrollBehavior:
            ScrollConfiguration.of(context).copyWith(scrollbars: false),
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Expenses App',
        home: const HomePage(),
      ),
    );
  }
}
