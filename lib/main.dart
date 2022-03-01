import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/usecases/locale_usecase.dart';
import 'core/usecases/transaction_usecase.dart';
import 'features/splash/splash.dart';
import 'generated/l10n.dart';
import 'theme/style.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => TransactionUsecase(),
        ),
        Provider(
          create: (context) => LocaleUseCase(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LocaleUseCase>(context, listen: false).locale;
    return ValueListenableBuilder(
      valueListenable: locale,
      builder: (context, child, widget) {
        return MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: locale.value,
          supportedLocales: S.delegate.supportedLocales,
          scrollBehavior:
              ScrollConfiguration.of(context).copyWith(scrollbars: false),
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          title: 'Expenses App',
          home: const SplashScreen(),
        );
      },
    );
  }
}
