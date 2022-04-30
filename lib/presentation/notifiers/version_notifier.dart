import 'package:flutter/cupertino.dart';

class VersionNotifier extends ChangeNotifier {
  String currentVersion = '12.1.1';
  List<dynamic> versionList = [];
  VersionNotifier();
  void changeVersion(String newVersion) {
    currentVersion = newVersion;
    notifyListeners();
  }

  void setVersionList(List<dynamic> newVersionList) {
    versionList = newVersionList;
    notifyListeners();
  }

  List<dynamic> getVersionList() {
    return versionList;
  }
}
