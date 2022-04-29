import '../../data/repositories/version_repository.dart';

abstract class IGetVersionUseCase {
  Future<String> execute();
}

class GetVersionUseCase extends IGetVersionUseCase {
  final  VersionRepository _versionRepository;
  GetVersionUseCase(this._versionRepository);

  @override
  Future<String> execute() async {
    return await _versionRepository.getVersion();
  }
}
