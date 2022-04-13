import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lolwiki/app/constants.dart';
import '../../domain/repository/champion_repository.dart';
import '../data_sources/data_dragon.dart';
import '../models/champion.dart';
import '../models/champion_detailed.dart';

class ChampionRepository implements IChampionRepository {
  final DataDragonAPI _dataDragonAPI;

  ChampionRepository(this._dataDragonAPI);
  @override
  Future<List<Champion>> getChampions(
      [Locale lang = const Locale('en', 'US')]) async {
    try {
      return await _dataDragonAPI.getChampions(lang);
    } catch (e) {
      throw Exception('Failed to load champions');
    }
  }

  @override
  Future<dynamic> getDetailedChampion(String championId,
      [Locale lang = const Locale('en', 'US')]) async {
    try {
      return await _dataDragonAPI.getDetailedChampion(championId, lang);
    } catch (e) {
      throw Exception('Failed to load champion $championId');
    }
  }
}
