import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/data/models/champion_model.dart';
import 'package:leaguechamps/data/models/image_model.dart';
import 'package:leaguechamps/data/models/info_model.dart';
import 'package:leaguechamps/data/models/stats_model.dart';
import 'package:leaguechamps/domain/entities/champion.dart';

void main() {
  final ChampionModel model = ChampionModel(
    version: "12.5.1",
    id: "Aatrox",
    key: "266",
    name: "Aatrox",
    title: "Darkin Kılıcı",
    blurb:
        "Bir zamanlar Shurima'yı Hiçlik'e karşı savunan onurlu savaşçılar olan Aatrox'la kardeşleri zamanla Runeterra için çok daha büyük bir tehdit haline geldiler ve sonunda ölümlülerin kurnazca büyülerine yenildiler. Fakat yüzyıllar boyu hapis kalan Aatrox...",
    info: InfoModel(attack: 8, defense: 4, magic: 3, difficulty: 4),
    image: ImageModel(
        full: "Aatrox.png",
        sprite: "champion0.png",
        group: "champion",
        x: 0,
        y: 0,
        w: 48,
        h: 48),
    tags: ["Fighter", "Tank"],
    partype: "Kan Kuyusu",
    stats: StatsModel(
        hp: 580,
        hpperlevel: 90,
        mp: 0,
        mpperlevel: 0,
        movespeed: 345,
        armor: 38,
        armorperlevel: 3.25,
        spellblock: 32,
        spellblockperlevel: 1.25,
        attackrange: 175,
        hpregen: 3,
        hpregenperlevel: 1,
        mpregen: 0,
        mpregenperlevel: 0,
        crit: 0,
        critperlevel: 0,
        attackdamage: 60,
        attackdamageperlevel: 5,
        attackspeedperlevel: 2.5,
        attackspeed: 0.651),
  );

  test('should return a valid model after fromJson', () {
    final rawJson = File('test/helpers/dummy_champion.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = jsonDecode(rawJson)['data']['Aatrox'];
    final result = ChampionModel.fromJson(jsonMap);
    expect(result, isA<Champion>());
  });

  test('should return toString method non-null', () {
    final result = model.toString();
    expect(result.length, greaterThan(0));
  });
  test('should print as String', () {
    final result = model.toString();
    expect(result, isA<String>());
  });
  test('should have same hashcode', () {
    final rawJson = File('test/helpers/dummy_champion.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = jsonDecode(rawJson)['data']['Aatrox'];
    final result = ChampionModel.fromJson(jsonMap);
    expect(model, result);
  });
}
