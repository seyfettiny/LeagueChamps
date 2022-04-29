import 'package:hive/hive.dart';

part 'stats.g.dart';

@HiveType(typeId: 8)
class Stats extends HiveObject {
  @HiveField(0)
  final num? hp;
  @HiveField(1)
  final num? hpperlevel;
  @HiveField(2)
  final num? mp;
  @HiveField(3)
  final num? mpperlevel;
  @HiveField(4)
  final num? movespeed;
  @HiveField(5)
  final num? armor;
  @HiveField(6)
  final num? armorperlevel;
  @HiveField(7)
  final num? spellblock;
  @HiveField(8)
  final num? spellblockperlevel;
  @HiveField(9)
  final num? attackrange;
  @HiveField(10)
  final num? hpregen;
  @HiveField(11)
  final num? hpregenperlevel;
  @HiveField(12)
  final num? mpregen;
  @HiveField(13)
  final num? mpregenperlevel;
  @HiveField(14)
  final num? crit;
  @HiveField(15)
  final num? critperlevel;
  @HiveField(16)
  final num? attackdamage;
  @HiveField(17)
  final num? attackdamageperlevel;
  @HiveField(18)
  final num? attackspeedperlevel;
  @HiveField(19)
  final num? attackspeed;

  Stats({
    required this.hp,
    required this.hpperlevel,
    required this.mp,
    required this.mpperlevel,
    required this.movespeed,
    required this.armor,
    required this.armorperlevel,
    required this.spellblock,
    required this.spellblockperlevel,
    required this.attackrange,
    required this.hpregen,
    required this.hpregenperlevel,
    required this.mpregen,
    required this.mpregenperlevel,
    required this.crit,
    required this.critperlevel,
    required this.attackdamage,
    required this.attackdamageperlevel,
    required this.attackspeedperlevel,
    required this.attackspeed,
  });
}
