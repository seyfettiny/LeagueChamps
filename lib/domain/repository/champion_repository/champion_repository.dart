import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lolwiki/app/constants.dart';

import '../../../common/models/champion.dart';

abstract class IChampionRepository {
  Future<List<Champion>> getChampions();
}

class ChampionRepository implements IChampionRepository {

  final http.Client _client = http.Client();
  @override
  Future<List<Champion>> getChampions() async {
    final response = await _client.get(Uri.parse(AppConstants.championAPIBaseUrl+'champion.json'));
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
}
