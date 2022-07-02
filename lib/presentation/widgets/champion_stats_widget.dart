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
          ],
        ),
      ),
    );
  }
}
