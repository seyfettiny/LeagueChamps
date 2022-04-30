import 'package:flutter/material.dart';

import '../entities/champion.dart';
import '../entities/champion_detailed.dart';

abstract class IChampionRepository {
  Future<List<Champion>> getChampions(String version, Locale lang);
  Future<ChampDetailed> getDetailedChampion(String championId, String version,
    Locale lang);
}
