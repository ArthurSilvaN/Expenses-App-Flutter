import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import 'features/splash/splash.dart';
import 'shared/providers/auth_provider.dart';
import 'shared/providers/home_controller.dart';
import 'shared/providers/locale_provider.dart';
import 'shared/providers/transaction_provider.dart';
import 'theme/style.dart';

part 'shared/providers_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providersList,
      child: Consumer2<HomeController, LocaleUseCase>(
        builder: (context, homeController, localeUseCase, widget) {
          return MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: localeUseCase.locale.value,
            supportedLocales: S.delegate.supportedLocales,
            scrollBehavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            darkTheme: appDarkTheme,
            themeMode: homeController.isDarkModeEnabled
                ? ThemeMode.dark
                : ThemeMode.light,
            title: 'Financy App',
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
