import 'package:flutter/cupertino.dart';

import '../../app/constants/hive_constants.dart';
import '../../data/data_sources/hive_service.dart';

class VersionNotifier extends ChangeNotifier {
  HiveService hiveService;
  String currentVersion = '12.1.1';
  VersionNotifier(this.hiveService) {
    if (hiveService.getBox(HiveConstants.HIVE_BOX_VERSION).isEmpty) {
      hiveService.saveVersion(currentVersion);
    }else{
      currentVersion = hiveService.getCurrentVersion();
    }
  }
  void changeVersion(String newVersion) {
    hiveService.saveVersion(newVersion);
    notifyListeners();
  }
}
