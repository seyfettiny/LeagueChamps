import 'package:leaguechamps/app/usecase/usecase.dart';

class GetVersionListUseCase extends UseCase<List<String>, String> {
  final _hiveService;
  final _versionRepository;
  GetVersionListUseCase(this._hiveService, this._versionRepository);

  @override
  Future<List<String>> execute(String params) {
    // TODO: implement execute

    throw UnimplementedError();
  }
}
