import 'package:flutter/material.dart';

import '../../data/models/champion.dart';

abstract class IChampionRepository {
  Future<List<Champion>> getChampions(Locale lang);
  Future<dynamic> getDetailedChampion(String championId, [Locale lang]);
}
