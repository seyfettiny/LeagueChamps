import 'package:hive/hive.dart';

part 'stats.g.dart';

@HiveType(typeId: 8)
class Stats extends HiveObject {
  @HiveField(0)
  num? hp;
  @HiveField(1)
  num? hpperlevel;
  @HiveField(2)
  num? mp;
  @HiveField(3)
  num? mpperlevel;
  @HiveField(4)
  num? movespeed;
  @HiveField(5)
  num? armor;
  @HiveField(6)
  num? armorperlevel;
  @HiveField(7)
  num? spellblock;
  @HiveField(8)
  num? spellblockperlevel;
  @HiveField(9)
  num? attackrange;
  @HiveField(10)
  num? hpregen;
  @HiveField(11)
  num? hpregenperlevel;
  @HiveField(12)
  num? mpregen;
  @HiveField(13)
  num? mpregenperlevel;
  @HiveField(14)
  num? crit;
  @HiveField(15)
  num? critperlevel;
  @HiveField(16)
  num? attackdamage;
  @HiveField(17)
  num? attackdamageperlevel;
  @HiveField(18)
  num? attackspeedperlevel;
  @HiveField(19)
  num? attackspeed;

  Stats(
      {this.hp,
      this.hpperlevel,
      this.mp,
      this.mpperlevel,
      this.movespeed,
      this.armor,
      this.armorperlevel,
      this.spellblock,
      this.spellblockperlevel,
      this.attackrange,
      this.hpregen,
      this.hpregenperlevel,
      this.mpregen,
      this.mpregenperlevel,
      this.crit,
      this.critperlevel,
      this.attackdamage,
      this.attackdamageperlevel,
      this.attackspeedperlevel,
      this.attackspeed});
}
