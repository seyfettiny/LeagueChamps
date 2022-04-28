import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/cupertino.dart';
import '../../domain/use_cases/get_version_list_usecase.dart';
import '../../domain/use_cases/get_version_usecase.dart';

class SplashViewModel extends ChangeNotifier {
  final GetVersionUseCase _getVersionUserCase;
  final GetVersionListUseCase _getVersionListUseCase;
  SplashViewModel(this._getVersionUserCase, this._getVersionListUseCase);

  Future<List<dynamic>> getVersionList() async {
    return await _getVersionListUseCase.execute();
  }

  Future<String> getVersion() async {
    print('${1}');
    return await _getVersionUserCase.execute();
  }
}
