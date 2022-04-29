import 'package:flutter/material.dart';
import 'package:leaguechamps/domain/entities/champion_detailed.dart';
import '../../presentation/notifiers/connectivity_notifier.dart';

import '../../domain/entities/champion.dart';
import '../../domain/repository/champion_repository.dart';
import '../data_sources/data_dragon.dart';
import '../data_sources/hive_service.dart';

class ChampionRepository implements IChampionRepository {
  final DataDragonAPI _dataDragonAPI;
  final HiveService _hiveService;
  final ConnectivityNotifier _connectivityNotifier;
  ChampionRepository(
      this._dataDragonAPI, this._hiveService, this._connectivityNotifier);
  @override
  Future<List<Champion>> getChampions(String version, Locale lang) async {
    if (_connectivityNotifier.hasConnection()) {
      try {
        final champions = await _dataDragonAPI.getChampions(version, lang);
        await _hiveService.saveChampions(
          version: version,
          lang: lang,
          champions: champions,
        );
        return champions;
      } catch (e) {
        print(e);
        throw Exception('Failed to load champions');
      }
    } else {
      try {
        final champions = await _hiveService.getChampions(version, lang);
        return champions;
      } catch (e) {
        throw Exception('Failed to load champions');
      }
    }
  }

  @override
  Future<ChampDetailed> getDetailedChampion(
      String championId, String version, Locale lang) async {
    if (_connectivityNotifier.hasConnection()) {
      final champDetailed =
          await _dataDragonAPI.getDetailedChampion(championId, version, lang);
      await _hiveService.saveDetailedChamp(
        version: version,
        lang: lang,
        champDetailed: champDetailed,
      );
      return champDetailed;
    } else {
      final champDetailed =
          await _hiveService.getDetailedChamp(championId,version, lang);
      return champDetailed;
    }
  }
}
