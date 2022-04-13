import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lolwiki/app/constants.dart';
import '../../domain/repository/champion_repository.dart';
import '../models/champion.dart';
import '../models/champion_detailed.dart';

class ChampionRepository implements IChampionRepository {
  final http.Client _client = http.Client();
  @override
  Future<List<Champion>> getChampions(
      [Locale lang = const Locale('en', 'US')]) async {
    final response = await _client.get(Uri.parse(
        AppConstants.championAPIBaseUrl + lang.toString() + '/champion.json'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final Map<String, dynamic> data = jsonResponse['data'];
      List<Champion> champions = [];
      data.forEach(
        (champion, data) {
          champions.add(Champion.fromJson(data));
        },
      );

      //* Sort champions
      // champions = champions
      //     .where((champion) => champion.stats!.attackdamage! >= 70)
      //     .toList();
      return champions;
    } else {
      throw Exception('Failed to load champions');
    }
  }

  Future<dynamic> getDetailedChampion(String championId,
      [Locale lang = const Locale('en', 'US')]) async {
    final response = await _client.get(Uri.parse(
        AppConstants.championAPIBaseUrl +
            lang.toString() +
            '/champion/$championId.json'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      final Map<String, dynamic> data = jsonResponse['data'][championId];
      return ChampDetailed.fromJson(data);
    } else {
      throw Exception('Failed to load champion');
    }
  }
}