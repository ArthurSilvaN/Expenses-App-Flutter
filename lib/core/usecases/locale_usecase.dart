import 'package:flutter/material.dart';

import '../../models/languages.dart';
import '../util/property_value_notifier.dart';

class LocaleUseCase extends ChangeNotifier {
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
