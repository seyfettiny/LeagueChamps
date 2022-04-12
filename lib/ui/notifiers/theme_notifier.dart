import 'package:flutter/material.dart';
import 'package:lolwiki/ui/themes/dark_theme.dart';

import '../themes/light_theme.dart';

class ThemeNotifier with ChangeNotifier {
  bool _darkTheme = false;

  ThemeNotifier();

  ThemeData get getTheme => _darkTheme ? darkTheme : lightTheme;

  void setTheme(ThemeData themeData) {
    if (themeData == darkTheme) {
      _darkTheme = false;
    } else {
      _darkTheme = true;
    }
    notifyListeners();
  }
}
