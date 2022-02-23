import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../common/models/champion.dart';

abstract class IChampionRepository {
  Future<List<Champion>> getChampions();
}

class ChampionRepository implements IChampionRepository {
  final String _baseUrl =
      "https://ddragon.leagueoflegends.com/cdn/12.2.1/data/en_US/champion.json";
  final http.Client _client = http.Client();
  @override
  Future<List<Champion>> getChampions() async {
    final response = await _client.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      final List<Champion> champions =
          data.map((champion) => Champion.fromJson(champion)).toList();
      return champions;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
