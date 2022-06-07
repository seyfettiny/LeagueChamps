import 'package:flutter/material.dart';

import '../../domain/entities/stats.dart';

class ChampStatsWidget extends StatelessWidget {
  final Stats stats;
  const ChampStatsWidget({Key? key, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 250,
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              direction: Axis.vertical,
              runSpacing: 10,
              spacing: 1,
              children: [
                Text('HP: ${stats.hp}'),
                Text('HP per level: ${stats.hpperlevel}'),
                Text('MP: ${stats.mp}'),
                Text('MP per level: ${stats.mpperlevel}'),
                Text('Move speed: ${stats.movespeed}'),
                Text('Armor: ${stats.armor}'),
                Text('Armor per level: ${stats.armorperlevel}'),
                Text('Spell block: ${stats.spellblock}'),
                Text('Spell block per level: ${stats.spellblockperlevel}'),
                Text('Attack Range: ${stats.attackrange}'),
                Text('HP regen: ${stats.hpregen}'),
                Text('HP regen per level: ${stats.hpregenperlevel}'),
                Text('MP regen: ${stats.mpregen}'),
                Text('MP regen per level: ${stats.mpregenperlevel}'),
                Text('Crit: ${stats.crit}'),
                Text('Crit per level: ${stats.critperlevel}'),
                Text('Attack damage: ${stats.attackdamage}'),
                Text('Attack damage per level: ${stats.attackdamageperlevel}'),
                Text('Attack speed: ${stats.attackspeed}'),
                Text('Attack speed per level: ${stats.attackspeedperlevel}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
