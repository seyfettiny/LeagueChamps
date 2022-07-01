import 'package:flutter/material.dart';

class ChampStatsWidget extends StatelessWidget {
  final Map stats;
  const ChampStatsWidget({Key? key, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 250,
      child: SizedBox.expand(
        child: Wrap(
          direction: Axis.vertical,
          runSpacing: 25,
          spacing: 8,
          children: [
            ...stats.entries
                .map(
                  (stat) => Row(
                    children: [
                      Tooltip(
                        triggerMode: TooltipTriggerMode.tap,
                        message: stat.key,
                        child: Image(
                          height: 30,
                          width: 30,
                          image: const AssetImage(
                              'assets/stats_icons/Health_icon.png'),
                          errorBuilder: (context, url, error) => const Center(
                            child: Icon(Icons.error),
                          ),
                        ),
                      ),
                      Text('  ${stat.value}'),
                    ],
                  ),
                )
                .toList(),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'HP',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image:
            //             const AssetImage('assets/stats_icons/Health_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats['hp']}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'HP per level',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats['hpperlevel']}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'MP',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage('assets/stats_icons/Mana_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats['mp']}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'MP per level',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats['mpperlevel']}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'Move speed',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.movespeed}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'Armor',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.armor}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'Armor per level',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.armorperlevel}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'Spell block',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.spellblock}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'Spell block per level',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.spellblockperlevel}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'Attack Range',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.attackrange}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'HP regen',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/stats_icons/Health_regeneration_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.hpregen}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'HP regen per level',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.hpregenperlevel}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'MP regen',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/stats_icons/Mana_regeneration_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.mpregen}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'MP regen per level',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.mpregenperlevel}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'Crit',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.crit}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'Crit per level',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.critperlevel}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'Attack damage',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.attackdamage}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'Attack damage per level',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.attackdamageperlevel}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'Attack speed',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.attackspeed}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Tooltip(
            //       triggerMode: TooltipTriggerMode.tap,
            //       message: 'Attack speed per level',
            //       child: Image(
            //         height: 30,
            //         width: 30,
            //         image: const AssetImage(
            //             'assets/champ_classes/Assassin_icon.png'),
            //         errorBuilder: (context, url, error) => const Center(
            //           child: Icon(Icons.error),
            //         ),
            //       ),
            //     ),
            //     Text('  ${stats.attackspeedperlevel}'),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
