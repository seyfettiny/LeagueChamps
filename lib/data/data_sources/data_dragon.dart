import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../app/utils/toast_service.dart';

import '../../app/constants/app_constants.dart';
import '../models/champion_detailed_model.dart';
import '../models/champion_model.dart';

abstract class IDataDragonAPI {
  Future<String> getVersion();
  Future<List<dynamic>> getVersionList();
  Future<List<ChampionModel>> getChampions(String version, Locale lang);
  Future<dynamic> getDetailedChampion(
      String championId, String version, Locale lang);
}

class DataDragonAPI implements IDataDragonAPI {
  final http.Client _client = http.Client();

  static final DataDragonAPI _instance = DataDragonAPI._internal();

  factory DataDragonAPI() => _instance;

  DataDragonAPI._internal();

  @override
  Future<String> getVersion() async {
    final response = await _client.get(Uri.parse(AppConstants.versionsUrl));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse[0];
    } else {
      ToastService.showErrorToast(
          'Failed to load version: ${response.statusCode}');
      throw Exception('Failed to load version');
    }
  }

  @override
  Future<List<dynamic>> getVersionList() async {
    final response = await _client.get(Uri.parse(AppConstants.versionsUrl));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse;
    } else {
      ToastService.showErrorToast(
          'Failed to load version: ${response.statusCode}');
      throw Exception('Failed to load version');
    }
  }

  @override
  Future<List<ChampionModel>> getChampions(String version, Locale lang) async {
    final response = await _client.get(Uri.parse(
        '${AppConstants.championAPIBaseUrl}$version/data/$lang/champion.json'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      final Map<String, dynamic> data = jsonResponse['data'];
      List<ChampionModel> champions = [];
      data.forEach(
        (champion, data) {
          champions.add(ChampionModel.fromJson(data));
        },
      );
      return champions;
    } else {
      ToastService.showErrorToast(
          'Failed to load champion: ${response.statusCode}');
      throw Exception('Failed to load champions');
    }
  }

  @override
  Future<dynamic> getDetailedChampion(
      String championId, String version, Locale lang) async {
    final response = await _client.get(Uri.parse(
        '${AppConstants.championAPIBaseUrl}$version/data/$lang/champion/$championId.json'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      final Map<String, dynamic> data = jsonResponse['data'][championId];
      return ChampDetailedModel.fromJson(data);
    } else {
      ToastService.showErrorToast(
          'Failed to load champion: ${response.statusCode}');
    }
  }
}
