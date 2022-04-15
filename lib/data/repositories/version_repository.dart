import 'package:leaguechamps/data/data_sources/data_dragon.dart';
import '../../domain/repository/version_repository.dart';

class VersionRepository implements IVersionRepository {
  final DataDragonAPI _dataDragonAPI;

  VersionRepository(this._dataDragonAPI);

  @override
  Future<String> getVersion() async {
    try {
      return await _dataDragonAPI.getVersion();
    } catch (e) {
      throw Exception('Failed to load version');
    }
  }

  @override
  Future<List<dynamic>> getVersionList() async {
    try {
      return await _dataDragonAPI.getVersionList();
    } catch (e) {
      throw Exception('Failed to load version list');
    }
  }
}
