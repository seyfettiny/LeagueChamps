import 'package:equatable/equatable.dart';

import '../../domain/entities/stats.dart';

class StatsModel extends Stats with EquatableMixin {
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
  List<Object?> get props => [
        hp,
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
        attackspeed,
      ];

  @override
  bool get stringify => true;
}
