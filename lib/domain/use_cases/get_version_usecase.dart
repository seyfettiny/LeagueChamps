abstract class IGetVersionUserCase {
  Future<String> execute();
}

class GetVersionUserCase extends IGetVersionUserCase {
  final _versionRepository;
  GetVersionUserCase(this._versionRepository);

  @override
  Future<String> execute() async {
    return await _versionRepository.getVersion();
  }
}
