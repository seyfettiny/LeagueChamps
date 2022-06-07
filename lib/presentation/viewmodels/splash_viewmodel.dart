import 'package:flutter/cupertino.dart';

import '../../domain/use_cases/get_version_list_usecase.dart';
import '../../domain/use_cases/get_version_usecase.dart';

class SplashViewModel extends ChangeNotifier {
  List<dynamic> _versionList = [];
  String _currentVersion = '';

  get currentVersion => _currentVersion;
  get versionList => _versionList;

  final GetVersionUseCase _getVersionUserCase;
  final GetVersionListUseCase _getVersionListUseCase;

  SplashViewModel(this._getVersionUserCase, this._getVersionListUseCase);
  Future<List<dynamic>> getVersionList() async {
    _versionList = await _getVersionListUseCase.execute();
    return _versionList;
  }

  Future<String> getVersion() async {
    _currentVersion = await _getVersionUserCase.execute();
    return _currentVersion;
  }

  // Future<void> refreshVersion() async {
  //   _versionList.clear();
  //   _currentVersion = await getVersion();
  //   _versionList = await getVersionList();
  //   notifyListeners();
  // }
}
