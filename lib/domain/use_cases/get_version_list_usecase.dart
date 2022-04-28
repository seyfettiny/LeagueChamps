abstract class IGetVersionListUseCase {
  Future<List<dynamic>> execute();
}

class GetVersionListUseCase extends IGetVersionListUseCase {
  final _versionRepository;
  GetVersionListUseCase(this._versionRepository);

  @override
  Future<List<dynamic>> execute() async {
    return await _versionRepository.getVersionList();
  }
}
