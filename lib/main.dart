import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/usecases/locale_usecase.dart';
import 'core/usecases/transaction_usecase.dart';
import 'features/home/home_controller.dart';
import 'features/splash/splash.dart';
import 'generated/l10n.dart';
import 'services/auth_service.dart';
import 'theme/style.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TransactionUsecase(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocaleUseCase(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
      ],
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
