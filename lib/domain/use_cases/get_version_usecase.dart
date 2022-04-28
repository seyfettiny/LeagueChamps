abstract class IGetVersionUseCase {
  Future<String> execute();
}

class GetVersionUseCase extends IGetVersionUseCase {
  final _versionRepository;
  GetVersionUseCase(this._versionRepository);

  @override
  Future<String> execute() async {
    return await _versionRepository.getVersion();
  }
}
