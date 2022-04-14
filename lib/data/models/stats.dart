import 'package:hive/hive.dart';

part 'stats.g.dart';

@HiveType(typeId: 9)
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

  Stats.fromJson(Map<String, dynamic> json) {
    hp = json['hp'];
    hpperlevel = json['hpperlevel'];
    mp = json['mp'];
    mpperlevel = json['mpperlevel'];
    movespeed = json['movespeed'];
    armor = json['armor'];
    armorperlevel = json['armorperlevel'];
    spellblock = json['spellblock'];
    spellblockperlevel = json['spellblockperlevel'];
    attackrange = json['attackrange'];
    hpregen = json['hpregen'];
    hpregenperlevel = json['hpregenperlevel'];
    mpregen = json['mpregen'];
    mpregenperlevel = json['mpregenperlevel'];
    crit = json['crit'];
    critperlevel = json['critperlevel'];
    attackdamage = json['attackdamage'];
    attackdamageperlevel = json['attackdamageperlevel'];
    attackspeedperlevel = json['attackspeedperlevel'];
    attackspeed = json['attackspeed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hp'] = hp;
    data['hpperlevel'] = hpperlevel;
    data['mp'] = mp;
    data['mpperlevel'] = mpperlevel;
    data['movespeed'] = movespeed;
    data['armor'] = armor;
    data['armorperlevel'] = armorperlevel;
    data['spellblock'] = spellblock;
    data['spellblockperlevel'] = spellblockperlevel;
    data['attackrange'] = attackrange;
    data['hpregen'] = hpregen;
    data['hpregenperlevel'] = hpregenperlevel;
    data['mpregen'] = mpregen;
    data['mpregenperlevel'] = mpregenperlevel;
    data['crit'] = crit;
    data['critperlevel'] = critperlevel;
    data['attackdamage'] = attackdamage;
    data['attackdamageperlevel'] = attackdamageperlevel;
    data['attackspeedperlevel'] = attackspeedperlevel;
    data['attackspeed'] = attackspeed;
    return data;
  }
  // Hive fields go here
}
