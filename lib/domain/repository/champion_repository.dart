import 'package:flutter/material.dart';
import 'package:leaguechamps/domain/entities/champion_detailed.dart';

import '../entities/champion.dart';

abstract class IChampionRepository {
  Future<List<Champion>> getChampions(String version, Locale lang);
  Future<ChampDetailed> getDetailedChampion(String championId, String version,
    Locale lang);
}
