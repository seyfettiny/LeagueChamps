abstract class IVersionRepository {
  Future<String> getVersion();
  Future<List<dynamic>> getVersionList();
}

