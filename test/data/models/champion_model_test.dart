import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/data/models/champion_model.dart';
import 'package:leaguechamps/data/models/image_model.dart';
import 'package:leaguechamps/data/models/info_model.dart';
import 'package:leaguechamps/data/models/stats_model.dart';
import 'package:leaguechamps/domain/entities/champion.dart';

void main() {
  final ChampionModel model = ChampionModel(
    id: 'id',
    key: 'key',
    version: '12.7.1',
    name: 'name',
    title: 'title',
    blurb: 'blurb',
    tags: ['tags'],
    partype: 'partype',
    image: ImageModel(
      full: 'full',
      sprite: 'sprite',
      group: 'group',
      x: 0,
      y: 0,
      w: 0,
      h: 0,
    ),
    info: InfoModel(
      attack: 8,
      defense: 4,
      magic: 3,
      difficulty: 4,
    ),
    stats: StatsModel(
      hp: 8,
      hpperlevel: 4,
      mp: 3,
      mpperlevel: 4,
      movespeed: 4,
      armor: 4,
      armorperlevel: 4,
      spellblock: 4,
      spellblockperlevel: 4,
      attackrange: 4,
      hpregen: 4,
      hpregenperlevel: 4,
      mpregen: 4,
      mpregenperlevel: 4,
      crit: 4,
      critperlevel: 4,
      attackdamage: 4,
      attackdamageperlevel: 4,
      attackspeedperlevel: 4,
      attackspeed: 4,
    ),
  );
    group('fromJson', () {
    test('should return a valid model after fromJson', () {
      final rawJson =
          File('test/helpers/dummy_champion.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = jsonDecode(rawJson);
      final result = ChampionModel.fromJson(jsonMap);
      expect(result, isA<Champion>());
    });
  });
  group('toString', () {
    test('should return toString method non-null', () {
      final result = model.toString();
      expect(result.length, greaterThan(0));
    });
    test('should print as String', () {
      final result = model.toString();
      expect(result, isA<String>());
    });
  });
}
