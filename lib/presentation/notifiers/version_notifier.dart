import 'package:flutter/cupertino.dart';
import 'package:leaguechamps/data/data_sources/hive_service.dart';

import '../../app/constants/hive_constants.dart';

class VersionNotifier extends ChangeNotifier {
  HiveService hiveService= HiveService();
  String currentVersion = '12.1.1';
  VersionNotifier() {
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
