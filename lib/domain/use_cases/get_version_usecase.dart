import 'package:leaguechamps/app/usecase/usecase.dart';

class GetVersionUserCase extends UseCase<String, String> {
  final _hiveService;
  final _versionNotifier;
  GetVersionUserCase(this._hiveService, this._versionNotifier);

  @override
  Future<String> execute(String params) {
        // TODO: implement execute

    throw UnimplementedError();
  }
}
