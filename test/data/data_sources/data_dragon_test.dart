import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/app/constants/app_constants.dart';
import 'package:leaguechamps/data/data_sources/data_dragon.dart';
import 'package:leaguechamps/data/models/champion_detailed_model.dart';
import 'package:leaguechamps/data/models/champion_model.dart';
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
        () async {
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));
      final result = await dataDragonAPI.getVersion();
      print(result.runtimeType);
      expect(result, throwsA(Exception()));
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
  const _version = '12.5.1';
  const _champId = 'Ahri';
  const _lang = Locale('tr', 'TR');
  group('getChampions', () {
    final _url =
        '${AppConstants.championAPIBaseUrl}$_version/data/$_lang/champion.json';
    Map jsonResult = json.decode(
        File('test/helpers/dummy_champion.json').readAsStringSync())['data'];
    final _championList = [];
    jsonResult.forEach((key, value) {
      _championList.add(ChampionModel.fromJson(value));
    });

    test('should return championList', () async {
      when(mockClient.get(Uri.parse(_url))).thenAnswer((_) async =>
          http.Response(
              File('test/helpers/dummy_champion.json').readAsStringSync(), 200,
              headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }));
      final result = await dataDragonAPI.getChampions(_version, _lang);
      expect(result[0], _championList[0]);
    });

    test('should throw an exception when getting championList', () {
      when(mockClient.get(Uri.parse(_url))).thenThrow((Exception()));
      final result = dataDragonAPI.getChampions(_version, _lang);
      expect(result, throwsException);
    });
    test('should return different statusCode when getting championList', () {
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));
      final result = dataDragonAPI.getChampions(_version, _lang);
      expect(result, throwsException);
    });
  });
  group('getChampionDetailed', () {
    Map<String, dynamic> jsonResult = json.decode(
        File('test/helpers/dummy_champ_detailed.json').readAsStringSync());
    final _championDetailed =
        ChampDetailedModel.fromJson(jsonResult['data'][_champId]);
    test('should return a champDetailedModel', () async {
      when(mockClient.get(any)).thenAnswer((_) async => http.Response(
              File('test/helpers/dummy_champ_detailed.json').readAsStringSync(),
              200,
              headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }));
      final ChampDetailedModel result =
          await dataDragonAPI.getDetailedChampion(_champId, _version, _lang);
      expect(result.info, equals(_championDetailed.info));
    });
    test('should throw an exception when getting championDetailed', () {
      when(mockClient.get(any)).thenThrow((Exception()));
      final result =
          dataDragonAPI.getDetailedChampion(_champId, _version, _lang);
      expect(result, throwsException);
    });
    test('should return different statusCode when getting championDetailed',
        () {
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response('Something went wrong', 400));
      final result =
          dataDragonAPI.getDetailedChampion(_champId, _champId, _lang);
      expect(result, throwsException);
    });
  });
}
