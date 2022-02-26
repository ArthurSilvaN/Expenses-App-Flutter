import 'package:flutter/material.dart';

import '../../models/languages.dart';

class LocaleUseCase extends ChangeNotifier {
  late Locale? _locale;

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  void clearLocale(Locale locale) {
    _locale = null;
    notifyListeners();
  }

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
