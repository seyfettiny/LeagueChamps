import 'package:flutter/cupertino.dart';

import '../../domain/use_cases/get_version_list_usecase.dart';
import '../../domain/use_cases/get_version_usecase.dart';

class SplashViewModel extends ChangeNotifier {
  // List<dynamic> _versionList = [];
  // String _currentVersion = '';
  // get currentVersion => _currentVersion;
  // get versionList => _versionList;
  final GetVersionUseCase _getVersionUserCase;
  final GetVersionListUseCase _getVersionListUseCase;
  SplashViewModel(this._getVersionUserCase, this._getVersionListUseCase);
  int i = 0;
  Future<List<dynamic>> getVersionList() async {
    print('splash ${++i}' );
    // _versionList = await _getVersionListUseCase.execute();
    // notifyListeners();
    return await _getVersionListUseCase.execute();
  }

  Future<String> getVersion() async {
    //_currentVersion = await _getVersionUserCase.execute();
    //notifyListeners();
    return await _getVersionUserCase.execute();
  }

  // Future<void> refreshVersion() async {
  //   _versionList.clear();
  //   _currentVersion = await getVersion();
  //   _versionList = await getVersionList();
  //   notifyListeners();
  // }
}
