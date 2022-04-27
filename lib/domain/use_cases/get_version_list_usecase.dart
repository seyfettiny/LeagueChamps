import 'package:leaguechamps/app/usecase/usecase.dart';

class GetVersionListUseCase extends UseCase<List<String>, String> {
  final _hiveService;
  final _versionNotifier;
  GetVersionListUseCase(this._hiveService, this._versionNotifier);

  @override
  Future<List<String>> execute(String params) {
    // TODO: implement execute

    throw UnimplementedError();
  }
}
