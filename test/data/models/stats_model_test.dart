import 'package:flutter_test/flutter_test.dart';
import 'package:leaguechamps/data/models/stats_model.dart';
import 'package:leaguechamps/domain/entities/stats.dart';

void main() {
  final StatsModel model = StatsModel(
    armor: 0,
    armorperlevel: 0,
    attackdamage: 0,
    attackdamageperlevel: 0,
    attackrange: 0,
    attackspeed: 0,
    attackspeedperlevel: 0,
    crit: 0,
    critperlevel: 0,
    hp: 0,
    hpperlevel: 0,
    hpregen: 0,
    hpregenperlevel: 0,
    movespeed: 0,
    mp: 0,
    mpperlevel: 0,
    mpregen: 0,
    mpregenperlevel: 0,
    spellblock: 0,
    spellblockperlevel: 0,
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
}
