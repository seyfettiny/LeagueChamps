import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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
  final http.Client? client;

  const DataDragonAPI(this.client);

  @override
  Future<String> getVersion() async {
    try {
      final response = await client!.get(Uri.parse(AppConstants.versionsUrl));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        return jsonResponse[0];
      } else {
        throw Exception('Failed to load version');
      }
    } on TimeoutException catch (e) {
      return e.message ?? 'Timeout Error!';
    } on FormatException catch (e) {
      return e.message;
    } on SocketException catch (e) {
      return e.message;
    } on PlatformException catch (e) {
      return e.message ?? 'Something is Wrong! Code: ${e.code}';
    } catch (e) {
      throw Exception('Failed to load version');
    }
  }

  @override
  Future<List<dynamic>> getVersionList() async {
    final response = await client!.get(Uri.parse(AppConstants.versionsUrl));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.getRange(0, 85).toList();
    } else {
      throw Exception('Failed to load version');
    }
  }

  @override
  Future<List<ChampionModel>> getChampions(String version, Locale lang) async {
    final response = await client!.get(Uri.parse(
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
      throw Exception('Failed to load champions');
    }
  }

  @override
  Future<dynamic> getDetailedChampion(
      String championId, String version, Locale lang) async {
    final response = await client!.get(Uri.parse(
        '${AppConstants.championAPIBaseUrl}$version/data/$lang/champion/$championId.json'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      final Map<String, dynamic> data = jsonResponse['data'][championId];
      return ChampDetailedModel.fromJson(data);
    } else {
      throw Exception('Failed to load champion');
    }
  }
}
