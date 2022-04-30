import '../../domain/repository/version_repository.dart';
import '../data_sources/data_dragon.dart';

class VersionRepository implements IVersionRepository {
  final DataDragonAPI _dataDragonAPI;
  VersionRepository(
      this._dataDragonAPI);

  @override
  Future<String> getVersion() async {
    try {
      return await _dataDragonAPI.getVersion();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<dynamic>> getVersionList() async {
    try {
      return await _dataDragonAPI.getVersionList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
