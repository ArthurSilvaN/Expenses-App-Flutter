import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../generated/l10n.dart';
import '../../core/util/property_value_notifier.dart';
import '../../entities/languages.dart';

class LocaleProvider extends ChangeNotifier {
  late PropertyValueNotifier<Locale?> locale =
      PropertyValueNotifier(const Locale('pt'));

  void setLocale(Locale localeValue) {
    locale.value = localeValue;
    notifyListeners();
  }

  void clearLocale() {
    locale.value = null;
    notifyListeners();
  }

  Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  List<Languages> get languagesLocale {
    return [
      Languages(
        flag: '🇧🇷',
        color: Colors.green,
        languageName: 'Portugês',
        locale: const Locale.fromSubtags(languageCode: 'pt'),
      ),
      Languages(
        flag: '🇺🇸',
        color: Colors.red,
        languageName: 'English',
        locale: const Locale.fromSubtags(languageCode: 'en'),
      ),
    ];
  }
}
