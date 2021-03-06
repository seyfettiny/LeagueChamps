import 'package:flutter/material.dart';

import '../../domain/entities/champion.dart';
import '../../domain/entities/champion_detailed.dart';
import '../../domain/repository/champion_repository.dart';
import '../data_sources/data_dragon.dart';

class ChampionRepository implements IChampionRepository {
  final DataDragonAPI _dataDragonAPI;
  ChampionRepository(this._dataDragonAPI);
  @override
  Future<List<Champion>> getChampions(String version, Locale lang) async {
    try {
      return await _dataDragonAPI.getChampions(version, lang);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ChampDetailed> getDetailedChampion(
      String championId, String version, Locale lang) async {
    try {
      return await _dataDragonAPI.getDetailedChampion(
          championId, version, lang);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
