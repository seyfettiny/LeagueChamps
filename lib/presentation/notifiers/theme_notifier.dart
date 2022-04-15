import 'package:flutter/material.dart';

import '../../app/themes/dark_theme.dart';
import '../../app/themes/light_theme.dart';

class ThemeNotifier with ChangeNotifier {
  bool _darkTheme = false;

  ThemeNotifier();

  ThemeData get getTheme => _darkTheme ? darkTheme : lightTheme;

  void setTheme(ThemeData themeData) {
    if (themeData == darkTheme) {
      _darkTheme = true;
    } else {
      _darkTheme = false;
    }
    notifyListeners();
  }
}
