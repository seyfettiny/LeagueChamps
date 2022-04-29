import '../../domain/entities/stats.dart';

class StatsModel extends Stats {
  StatsModel(
      {hp,
      hpperlevel,
      mp,
      mpperlevel,
      movespeed,
      armor,
      armorperlevel,
      spellblock,
      spellblockperlevel,
      attackrange,
      hpregen,
      hpregenperlevel,
      mpregen,
      mpregenperlevel,
      crit,
      critperlevel,
      attackdamage,
      attackdamageperlevel,
      attackspeedperlevel,
      attackspeed})
      : super(
            hp: hp,
            hpperlevel: hpperlevel,
            mp: mp,
            mpperlevel: mpperlevel,
            movespeed: movespeed,
            armor: armor,
            armorperlevel: armorperlevel,
            spellblock: spellblock,
            spellblockperlevel: spellblockperlevel,
            attackrange: attackrange,
            hpregen: hpregen,
            hpregenperlevel: hpregenperlevel,
            mpregen: mpregen,
            mpregenperlevel: mpregenperlevel,
            crit: crit,
            critperlevel: critperlevel,
            attackdamage: attackdamage,
            attackdamageperlevel: attackdamageperlevel,
            attackspeedperlevel: attackspeedperlevel,
            attackspeed: attackspeed);

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
  String toString() {
    return 'Stats(hp: $hp, hpperlevel: $hpperlevel, mp: $mp, mpperlevel: $mpperlevel, movespeed: $movespeed, armor: $armor, armorperlevel: $armorperlevel, spellblock: $spellblock, spellblockperlevel: $spellblockperlevel, attackrange: $attackrange, hpregen: $hpregen, hpregenperlevel: $hpregenperlevel, mpregen: $mpregen, mpregenperlevel: $mpregenperlevel, crit: $crit, critperlevel: $critperlevel, attackdamage: $attackdamage, attackdamageperlevel: $attackdamageperlevel, attackspeedperlevel: $attackspeedperlevel, attackspeed: $attackspeed)';
  }
}
