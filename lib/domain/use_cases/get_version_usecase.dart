import 'package:leaguechamps/app/usecase/usecase.dart';

class GetVersionUserCase extends UseCase<String, String> {
  final _hiveService;
  final _versionRepository;
  GetVersionUserCase(this._hiveService, this._versionRepository);


  @override
  Future<String> execute(String params) {
        // TODO: implement execute

    throw UnimplementedError();
  }
}
