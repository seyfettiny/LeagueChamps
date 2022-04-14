import 'package:flutter/material.dart';

import '../../data/models/champion.dart';

abstract class IChampionRepository {
  Future<List<Champion>> getChampions(String version, Locale lang);
  Future<dynamic> getDetailedChampion(String championId, String version,
    Locale lang);
}
