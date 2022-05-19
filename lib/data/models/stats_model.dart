import '../../domain/entities/stats.dart';

class StatsModel extends Stats {
  StatsModel(
      {super.hp,
      super.hpperlevel,
      super.mp,
      super.mpperlevel,
      super.movespeed,
      super.armor,
      super.armorperlevel,
      super.spellblock,
      super.spellblockperlevel,
      super.attackrange,
      super.hpregen,
      super.hpregenperlevel,
      super.mpregen,
      super.mpregenperlevel,
      super.crit,
      super.critperlevel,
      super.attackdamage,
      super.attackdamageperlevel,
      super.attackspeedperlevel,
      super.attackspeed});

  factory StatsModel.fromJson(Map<String, dynamic> json) => StatsModel(
        hp: json['hp'],
        hpperlevel: json['hpperlevel'],
        mp: json['mp'],
        mpperlevel: json['mpperlevel'],
        movespeed: json['movespeed'],
        armor: json['armor'],
        armorperlevel: json['armorperlevel'],
        spellblock: json['spellblock'],
        spellblockperlevel: json['spellblockperlevel'],
        attackrange: json['attackrange'],
        hpregen: json['hpregen'],
        hpregenperlevel: json['hpregenperlevel'],
        mpregen: json['mpregen'],
        mpregenperlevel: json['mpregenperlevel'],
        crit: json['crit'],
        critperlevel: json['critperlevel'],
        attackdamage: json['attackdamage'],
        attackdamageperlevel: json['attackdamageperlevel'],
        attackspeedperlevel: json['attackspeedperlevel'],
        attackspeed: json['attackspeed'],
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatsModel &&
          runtimeType == other.runtimeType &&
          hp == other.hp &&
          hpperlevel == other.hpperlevel &&
          mp == other.mp &&
          mpperlevel == other.mpperlevel &&
          movespeed == other.movespeed &&
          armor == other.armor &&
          armorperlevel == other.armorperlevel &&
          spellblock == other.spellblock &&
          spellblockperlevel == other.spellblockperlevel &&
          attackrange == other.attackrange &&
          hpregen == other.hpregen &&
          hpregenperlevel == other.hpregenperlevel &&
          mpregen == other.mpregen &&
          mpregenperlevel == other.mpregenperlevel &&
          crit == other.crit &&
          critperlevel == other.critperlevel &&
          attackdamage == other.attackdamage &&
          attackdamageperlevel == other.attackdamageperlevel &&
          attackspeedperlevel == other.attackspeedperlevel &&
          attackspeed == other.attackspeed;

  @override
  int get hashCode =>
      hp.hashCode ^
      hpperlevel.hashCode ^
      mp.hashCode ^
      mpperlevel.hashCode ^
      movespeed.hashCode ^
      armor.hashCode ^
      armorperlevel.hashCode ^
      spellblock.hashCode ^
      spellblockperlevel.hashCode ^
      attackrange.hashCode ^
      hpregen.hashCode ^
      hpregenperlevel.hashCode ^
      mpregen.hashCode ^
      mpregenperlevel.hashCode ^
      crit.hashCode ^
      critperlevel.hashCode ^
      attackdamage.hashCode ^
      attackdamageperlevel.hashCode ^
      attackspeedperlevel.hashCode ^
      attackspeed.hashCode;

  @override
  String toString() {
    return 'Stats(hp: $hp, hpperlevel: $hpperlevel, mp: $mp, mpperlevel: $mpperlevel, movespeed: $movespeed, armor: $armor, armorperlevel: $armorperlevel, spellblock: $spellblock, spellblockperlevel: $spellblockperlevel, attackrange: $attackrange, hpregen: $hpregen, hpregenperlevel: $hpregenperlevel, mpregen: $mpregen, mpregenperlevel: $mpregenperlevel, crit: $crit, critperlevel: $critperlevel, attackdamage: $attackdamage, attackdamageperlevel: $attackdamageperlevel, attackspeedperlevel: $attackspeedperlevel, attackspeed: $attackspeed)';
  }
}
