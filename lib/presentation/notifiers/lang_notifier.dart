import 'package:flutter/cupertino.dart';

import '../../app/constants.dart';

class LangNotifier extends ChangeNotifier {

  var _selectedLang = const Locale('en', 'US');

  get selectedLang => _selectedLang;

  get langs => AppConstants.supportedLocales;

  setLanguage(Locale lang) {
    if (AppConstants.supportedLocales.contains(lang)) {
      _selectedLang = lang;
      notifyListeners();
    }
  }
}
