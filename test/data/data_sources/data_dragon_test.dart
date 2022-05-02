import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/app/constants/app_constants.dart';
import 'package:leaguechamps/data/data_sources/data_dragon.dart';
import 'package:leaguechamps/data/models/champion_model.dart';
import 'package:leaguechamps/domain/entities/champion.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'data_dragon_test.mocks.dart';

@GenerateMocks([
  DataDragonAPI,
  http.Client,
])
void main() {
  late DataDragonAPI dataDragonAPI;
  late MockClient mockClient;
  setUp(() {
    mockClient = MockClient();
    dataDragonAPI = DataDragonAPI(mockClient);
  });
  group('getVersion', () {
    test('should return version', () async {
      when(mockClient.get(any)).thenAnswer((_) async => http.Response(
          File('test/helpers/dummy_version_list.json').readAsStringSync(),
          200));
      final result = await dataDragonAPI.getVersion();
      expect(result, isA<String>());
    });
    test('should throws an exception when http call completes with an error',
        () {
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));
      expect(dataDragonAPI.getVersion(), throwsA(isA<Exception>()));
    });
  });

  group('getVersionList', () {
    test('should return version list', () async {
      when(mockClient.get(any)).thenAnswer((_) async => http.Response(
          File('test/helpers/dummy_version_list.json').readAsStringSync(),
          200));
      final result = await dataDragonAPI.getVersionList();
      expect(result, isA<List>());
    });
    test('should throws an exception when http call completes with an error',
        () {
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));
      expect(dataDragonAPI.getVersionList(), throwsA(isA<Exception>()));
    });
  });
  group('getChampion', () {
    const _version = '12.8.1';
    const _lang = Locale('en', 'US');
    final _url =
        '${AppConstants.championAPIBaseUrl}$_version/data/$_lang/champion.json';
    final _championList = [
      ChampionModel.fromJson(jsonDecode(
          File('test/helpers/dummy_champion.json').readAsStringSync()))
    ];
    print(jsonEncode(
        File('test/helpers/dummy_champion.json').readAsStringSync()));

    test('should return championList', () async {
      when(mockClient.get(any)).thenAnswer((_) async => http.Response(
          jsonEncode(
              File('test/helpers/dummy_champion.json').readAsStringSync()),
          200));
      final result = await dataDragonAPI.getChampions(_version, _lang);
      expect(result, equals(_championList));
    });
  });
}
