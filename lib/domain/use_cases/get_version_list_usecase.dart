abstract class IGetVersionListUseCase {
  Future<List<String>> execute();
}

class GetVersionListUseCase extends IGetVersionListUseCase {
  final _versionRepository;
  GetVersionListUseCase(this._versionRepository);

  @override
  Future<List<String>> execute() async {
    return await _versionRepository.getVersionList();
  }
}
