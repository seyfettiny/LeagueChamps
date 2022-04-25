import 'package:flutter/material.dart';
import 'package:leaguechamps/app/constants/hive_constants.dart';
import '../../data/data_sources/hive_service.dart';

class ThemeNotifier with ChangeNotifier {
  HiveService hiveService;

  bool _darkTheme = true;

  ThemeNotifier(this.hiveService) {
    if (hiveService
            .getBox(HiveConstants.HIVE_BOX_SETTINGS)
            .get(HiveConstants.HIVE_KEY_THEME) ==
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
