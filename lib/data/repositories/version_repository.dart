import 'package:leaguechamps/data/data_sources/hive_service.dart';

import '../data_sources/data_dragon.dart';

import '../../domain/repository/version_repository.dart';

class VersionRepository implements IVersionRepository {
  final DataDragonAPI _dataDragonAPI;
  final HiveService _hiveService;

  VersionRepository(this._dataDragonAPI, this._hiveService);

  @override
  Future<String> getVersion() async {
    try {
      final version = await _dataDragonAPI.getVersion();
      await _hiveService.saveVersion(version);
      print('version: ${_hiveService.getCurrentVersion()}');

      return version;
    } catch (e) {
      throw Exception('Failed to load version');
    }
  }

  @override
  Future<List<dynamic>> getVersionList() async {
    try {
      final versionList = await _dataDragonAPI.getVersionList();
      await _hiveService.saveVersionList(versionList);
      print('versionList: ${_hiveService.getVersionList().runtimeType}');
      return versionList;
    } catch (e) {
      print(e);
      throw Exception('Failed to load version list');
    }
  }
}
