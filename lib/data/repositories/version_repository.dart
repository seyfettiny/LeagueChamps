import '../data_sources/hive_service.dart';
import '../../presentation/notifiers/connectivity_notifier.dart';

import '../data_sources/data_dragon.dart';

import '../../domain/repository/version_repository.dart';

class VersionRepository implements IVersionRepository {
  final DataDragonAPI _dataDragonAPI;
  final HiveService _hiveService;
  final ConnectivityNotifier _connectivityNotifier;
  VersionRepository(
      this._dataDragonAPI, this._hiveService, this._connectivityNotifier);

  @override
  Future<String> getVersion() async {
    if (_connectivityNotifier.hasConnection()) {
      try {
        final version = await _dataDragonAPI.getVersion();
        await _hiveService.saveVersion(version);
        print('version: $version');
        return version;
      } catch (e) {
        print(e);
        throw Exception('Failed to load version');
      }
    } else {
      try {
        final version = _hiveService.getCurrentVersion();
        print('version: $version');
        return version;
      } catch (e) {
        throw Exception('Failed to load version');
      }
    }
  }

  @override
  Future<List<dynamic>> getVersionList() async {
    if (_connectivityNotifier.hasConnection()) {
      try {
        final versionList = await _dataDragonAPI.getVersionList();
        await _hiveService.saveVersionList(versionList);
        return versionList;
      } catch (e) {
        print(e);
        throw Exception('Failed to load version list');
      }
    } else {
      try {
        final versionList = _hiveService.getVersionList();
        return versionList;
      } catch (e) {
        throw Exception('Failed to load version list');
      }
    }
  }
}
