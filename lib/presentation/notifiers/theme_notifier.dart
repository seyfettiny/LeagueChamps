import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leaguechamps/app/constants.dart';
import 'package:leaguechamps/data/data_sources/hive_service.dart';

class ThemeNotifier with ChangeNotifier {
  HiveService hiveService = HiveService();

  bool _darkTheme = true;

  ThemeNotifier() {
    if (hiveService
            .getBox(AppConstants.HIVE_BOX_SETTINGS)
            .get(AppConstants.HIVE_KEY_THEME) ==
        null) {
      hiveService.setDarkTheme(_darkTheme);
    } else {
      _darkTheme = hiveService.isDarkTheme();
    }
  }
  bool get isDarkTheme => _darkTheme ? true : false;

  void changeTheme() {
    _darkTheme = !_darkTheme;
    HiveService().setDarkTheme(_darkTheme);
    notifyListeners();
  }
}
