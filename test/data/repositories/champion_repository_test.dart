import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/data/models/champion_detailed_model.dart';
import 'package:leaguechamps/data/models/champion_model.dart';
import 'package:leaguechamps/data/repositories/champion_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../data_sources/data_dragon_test.mocks.dart';

@GenerateMocks([ChampionRepository])
void main() {
  late ChampionRepository repository;
  late MockDataDragonAPI mockDataDragonAPI;
  setUp(() {
    mockDataDragonAPI = MockDataDragonAPI();
    repository = ChampionRepository(mockDataDragonAPI);
  });
  const String championId = 'Aatrox';
  const String version = '9.24.1';
  const Locale lang = Locale('en', 'US');
  group('getChampionList', () {
    test('should get champion list', () async {
      when(mockDataDragonAPI.getChampions(version, lang))
          .thenAnswer((_) async => [ChampionModel()]);
      final champions = await repository.getChampions(version, lang);
      expect(champions, [ChampionModel()]);
    });
    test('should throw an Exception when getting champion list', () {
      when(mockDataDragonAPI.getChampions(version, lang))
          .thenThrow(Exception());
      final champions = repository.getChampions(version, lang);
      expect(champions, throwsException);
    });
  });
  group('getDetailedChampion', () {
    test('should get detailed champion', () async {
      when(mockDataDragonAPI.getDetailedChampion(championId, version, lang))
          .thenAnswer((_) async =>
              ChampDetailedModel(id: championId, name: championId));
      final champion =
          await repository.getDetailedChampion(championId, version, lang);
      expect(champion, ChampDetailedModel(id: championId, name: championId));
    });
    test('should throw an Exception when gettin detailed champion', () async {
      when(mockDataDragonAPI.getDetailedChampion(championId, version, lang))
          .thenThrow(Exception());
      final champion =
          repository.getDetailedChampion(championId, version, lang);
      expect(champion, throwsException);
    });
  });
}
