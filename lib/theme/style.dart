import 'package:flutter/material.dart';

import 'hex_color.dart';

part 'button_theme.dart';
part 'colors.dart';

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
    backgroundColor: HexColor('#FF941A'),
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
          headline6: const TextStyle(
              fontFamily: 'OpenSans', fontSize: 20, color: Colors.white),
        )
        .headline6,
  ),
  colorScheme: _colorScheme,
);

extension ExpensesAppTheme on ThemeData {
  ElevatedButtonThemeData get elevatedButtonPrimaryTheme =>
      _elevatedButtonPrimaryTheme;
}
