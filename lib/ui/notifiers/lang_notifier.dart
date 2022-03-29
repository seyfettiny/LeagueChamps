import 'package:flutter/cupertino.dart';

class LangNotifier extends ChangeNotifier {
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('cs', 'CZ'),
    Locale('de', 'DE'),
    Locale('el', 'GR'),
    Locale('en', 'AU'),
    Locale('en', 'GB'),
    Locale('en', 'PH'),
    Locale('en', 'SG'),
    Locale('es', 'AR'),
    Locale('es', 'ES'),
    Locale('es', 'MX'),
    Locale('fr', 'FR'),
    Locale('hu', 'HU'),
    Locale('id', 'ID'),
    Locale('it', 'IT'),
    Locale('ja', 'JP'),
    Locale('ko', 'KR'),
    Locale('pl', 'PL'),
    Locale('pt', 'BR'),
    Locale('ro', 'RO'),
    Locale('ru', 'RU'),
    Locale('th', 'TH'),
    Locale('tr', 'TR'),
    Locale('vn', 'VN'),
    Locale('zh', 'CN'),
    Locale('zh', 'MY'),
    Locale('zh', 'TW')
  ];
  var _selectedLang = const Locale('en', 'US');

  get selectedLang => _selectedLang;

  get langs => supportedLocales;

  setLanguage(Locale lang) {
    if (supportedLocales.contains(lang)) {
      _selectedLang = lang;
      notifyListeners();
    }
  }
}
