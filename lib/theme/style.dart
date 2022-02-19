import 'package:flutter/material.dart';

part 'button_theme.dart';

final appTheme = ThemeData(
  fontFamily: 'Quicksand',
  textTheme: ThemeData.light().textTheme.copyWith(
        headline6: const TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        button: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
  appBarTheme: AppBarTheme(
    toolbarTextStyle: ThemeData.light()
        .textTheme
        .copyWith(
          headline6: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
          ),
        )
        .bodyText2,
    titleTextStyle: ThemeData.light()
        .textTheme
        .copyWith(
          headline6: const TextStyle(fontFamily: 'OpenSans', fontSize: 20),
        )
        .headline6,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
);

extension ExpensesAppTheme on ThemeData {
  ElevatedButtonThemeData get elevatedButtonPrimaryTheme =>
      _elevatedButtonPrimaryTheme;
}
