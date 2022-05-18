import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/data/models/stats_model.dart';
import 'package:leaguechamps/domain/entities/stats.dart';

void main() {
  final StatsModel model = StatsModel(
    armor: 18,
    armorperlevel: 3.5,
    attackdamage: 53,
    attackdamageperlevel: 3,
    attackrange: 550,
    attackspeed: 0.668,
    attackspeedperlevel: 2,
    crit: 0,
    critperlevel: 0,
    hp: 500,
    hpperlevel: 82,
    hpregen: 2.5,
    hpregenperlevel: 0.6,
    movespeed: 330,
    mp:418,
    mpperlevel: 25,
    mpregen: 8,
    mpregenperlevel: 0.8,
    spellblock: 30,
    spellblockperlevel: 0.5,
  );
  test('should return toString method non-null', () {
    final result = model.toString();
    expect(result.length, greaterThan(0));
  });
  test('should print as String', () {
    final result = model.toString();
    expect(result, isA<String>());
  });
  test('should be subtype of Stats', () {
    expect(model, isA<Stats>());
  });
    test('should have same hashcode', () {
    final result = StatsModel.fromJson(
        jsonDecode('{"hp": 500,"hpperlevel": 82,"mp": 418,"mpperlevel": 25,"movespeed": 330,"armor": 18,"armorperlevel": 3.5,"spellblock": 30,"spellblockperlevel": 0.5,"attackrange": 550,"hpregen": 2.5,"hpregenperlevel": 0.6,"mpregen": 8,"mpregenperlevel": 0.8,"crit": 0,"critperlevel": 0,"attackdamage": 53,"attackdamageperlevel": 3,"attackspeedperlevel": 2,"attackspeed": 0.668}'));
    expect(model.hashCode, result.hashCode);
  });
}
